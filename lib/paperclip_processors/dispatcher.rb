module Paperclip

  class documentTypeSpoofDetector
    def spoofed?
      false
    end    
    private
    def type_from_file_command
      begin
         Paperclip.run("file", "-b --mime :file", :file => @file.path)
      rescue Cocaine::CommandLineError
        ""
      end
    end    
    Paperclip.options[:content_type_mappings] = { xlsx: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' }
  end

  class BaseProcessor < Processor

    def initialize file, options={}, attachment=nil
      super
      
      @document = attachment.instance
    end

    def log message
      Paperclip.log message
    end

    def temp_file basename, extension, data=nil
      t = Tempfile.new [basename, extension]
      t.binmode
      t.write data if data.present?
      t.rewind
      t
    end

    def from_file
      File.expand_path(@file.path)
    end

    def to_file destination
      File.expand_path(destination.path)
    end

  end

  class Dispatcher < BaseProcessor

    def make
      log 'start...'

        begin
          case @document.document_type.document_category
          when :AUDIO
						output = AudioMagick.new(@file, @options, @attachment).make
            log 'AUDIO'
 
          when :VIDEO
						output = VideoMagick.new(@file, @options, @attachment).make
            log 'VIDEO'

          when :IMAGE
						output = ImageMagick.new(@file, @options, @attachment).make
            log 'IMAGE'

          when :DOCUMENT
						output = DocumentMagick.new(@file, @options, @attachment).make
            log 'DOCUMENT'
          else
            raise "#{@document.document_type.document_category} is not supported yet"
          end
        rescue
          log 'dispatcher: an error:'
          log $!.message
          $!.backtrace.map { |l| log l }
        end
        
       log 'end...' 

      end

      output
    end

  end

  class Void < BaseProcessor
    def make
      log 'void processor: just do nothing, saving...'
      File.open @file.path
    end
  end
  
  class VideoMagick < BaseProcessor

    def make
			
      log 'videomagick'

      from_extension = File.extname(from_file) 
      from_basename = File.basename(from_file, from_extension)

      width  = @document.document_type.attr :WIDTH
      height = @document.document_type.attr :HEIGHT
      background = @document.document_type.attr :HEIGHT :BACKGROUND_COLOR    
      segment_time = @document.document_type.attr :SEGMENT_TIME
      bit_rate = @document.document_type.attr :BIT_RATE
      audio_rate = @document.document_type.attr :AUDIO_RATE
      constant_rate_factor = @document.document_type.attr :CONSTANT_RATE_FACTOR
      
      temp = temp_file from_basename, @document.document_type.extension
      
      #HTTP Live streaming
      if @document.document_type.extension == '.ts'
				document_path = File.dirname(@document.path)
				FileUtils.mkdir_p(document_path) unless File.exists?(document_path)
				#Ref: http://www.subsonic.org/pages/transcoding.jsp
				command = "-i #{from_file} -map 0:0 -async 1 -vcodec libx264 -acodec libmp3lame -b:v #{bit_rate}K -preset superfast -crf #{constant_rate_factor} -ar #{audio_rate} -ac 2 -v 0 -s #{width}x#{height} -f ssegment -segment_list #{to_file(temp)} -segment_list_flags +live -segment_time #{segment_time} #{document_path}/out%03d.ts"
      else
				command = "-i #{from_file} -async 1 -vcodec libx264 -b:v #{bit_rate}K -preset superfast -crf #{constant_rate_factor} -ar #{audio_rate} -ac 2 -v 0 -s #{width}x#{height} #{to_file(temp)}"
      end

      log "command: #{command}"
      log '------------------------------------------------'

      Paperclip.run('ffmpeg', command)
           
      temp
    end

  end      
  
  class AudioMagick < BaseProcessor

    def make
			
      log 'audiomagick'

      from_extension = File.extname(from_file) 
      from_basename = File.basename(from_file, from_extension)

      audio_rate = @document.document_type.attr :AUDIO_RATE
            
      temp = temp_file from_basename, @document.document_type.extension
      
      #audio transcoding
			command = "-i %s -ab %bk -v 0 -f mp3 -ar #{audio_rate} -ac 2 -v 0 #{to_file(temp)}"
			
      log "command: #{command}"
      log '------------------------------------------------'

      Paperclip.run('ffmpeg', command)
           
      temp
    end

  end   
  

  class ImageMagick < BaseProcessor

    def make
      log 'imagemagick processor:'

      from_extension = File.extname(from_file) 
      from_basename = File.basename(from_file, from_extension)

      width  = @document.document_type.attr :WIDTH
      height = @document.document_type.attr :HEIGHT
      background = @document.document_type.attr :HEIGHT :BACKGROUND_COLOR

      temp = temp_file from_basename, @document.document_type.extension

      command = "convert #{from_file} -thumbnail #{width}x#{height} -background #{background} -flatten #{to_file(temp)}"

      log "command: #{command}"
      log '------------------------------------------------'

      Paperclip.run(command)
      
      Paperclip.run(CropperItem.trans_command) if @document.is_cropped?
      
      temp
    end
  end
  
  class DocumentMagick < BaseProcessor

    def make
      log 'documentmagick:'

      from_extension = File.extname(from_file) 
      from_basename = File.basename(from_file, from_extension)

      temp = temp_file from_basename, @document.document_type.extension
    
      temp
    end
  end    
  
  
  class CropperItem < Thumbnail
    def trans_command
      if crop_command
				crop_command + super
      else
        super
      end
    end

    def crop_command(dimensions = nil)
      target = @attachment.instance
      if target.cropping?
        case dimensions
        when 'square'
          if target.crop_w > target.crop_h
            crop_w = target.crop_w.to_i
            crop_h = target.crop_w.to_i
            crop_x = target.crop_x.to_i
            crop_y = target.crop_y.to_i - ((target.crop_w.to_i-target.crop_h.to_i)/2).to_i
          elsif target.crop_w < target.crop_h
            crop_w = target.crop_h.to_i
            crop_h = target.crop_h.to_i
            crop_x = target.crop_x.to_i - ((target.crop_h.to_i-target.crop_w.to_i)/2).to_i
            crop_y = target.crop_y.to_i
          else
            crop_w = target.crop_w.to_i
            crop_h = target.crop_h.to_i
            crop_x = target.crop_x.to_i
            crop_y = target.crop_y.to_i
          end
          ["-crop", "#{crop_w}x#{crop_h}+#{crop_x}+#{crop_y}", "+repage"]
        else
          ["-crop", "#{target.crop_w.to_i}x#{target.crop_h.to_i}+#{target.crop_x.to_i}+#{target.crop_y.to_i}", "+repage"]
        end
      end
    end
  end  

end
