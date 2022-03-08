class Attachment < ApplicationRecord
    mount_uploader :attachment, AttachmentUploader # Tells rails to use this uploader for this model.   
    validates :name, presence: true
    before_save :scan_for_viruses

    private

    def scan_for_viruses
        return unless self.attachment
    
        path = self.attachment.file.path
        self.safe = Clamby.safe?(path)
    end
end
