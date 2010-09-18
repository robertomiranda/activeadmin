module ActiveAdmin
  class AdminCommentsController < ResourceController
    
    actions :create
    
    def create
      @admin_comment = AdminComment.new(params[:active_admin_admin_comment])
      
      if @admin_comment.save
        respond_to do |format|
          format.js { render :partial => "admin/admin_comments/admin_comment", :locals => {:admin_comment => @admin_comment} }
        end
      else
        respond_to do |format|
          format.json { render :json => @admin_comment.errors.full_messages, :status => :precondition_failed }
        end
      end
    end
    
    def add_section_breadcrumb; end
    def set_current_tab; end
  end
end