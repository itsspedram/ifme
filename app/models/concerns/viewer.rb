# frozen_string_literal: true

module Viewer
  extend ActiveSupport::Concern

  class_methods do
    def destroy_viewer(user_id, viewer_id)
      where(userid: user_id).find_each do |instance|
        viewers = instance.viewers

        if viewers.include?(viewer_id)
          viewers.delete(viewer_id)
          update(instance.id, viewers: viewers)
        end
      end
    end
  end
end
