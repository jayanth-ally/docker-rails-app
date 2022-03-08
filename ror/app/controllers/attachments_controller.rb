class AttachmentsController < ApplicationController
  def index
    @attachments = Attachment.all
  end

  def new
    @attachment = Attachment.new
  end

  def create
    puts "Params"
    puts attachment_params
    @attachment = Attachment.new(attachment_params)
    if @attachment.save
      redirect_to attachments_path, notice: "Upload successful"
    else
      redirect_to attachments_path, notice: "Upload Failed"
    end
  end

  def destroy
    @attachment = Attachment.find(params[:id])
    @attachment.destroy
    redirect_to attachments_path, notice: "Delete successful"
  end

  private

  def attachment_params
    params.require(:attachment).permit(:name, :attachment)
  end
end
