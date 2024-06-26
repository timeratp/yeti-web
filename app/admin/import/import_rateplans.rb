# frozen_string_literal: true

ActiveAdmin.register Importing::Rateplan, as: 'Rateplan Imports' do
  filter :o_id
  filter :name
  boolean_filter :is_changed

  acts_as_import_preview

  controller do
    def resource_params
      return [{}] if request.get?

      [params[active_admin_config.resource_class.model_name.param_key.to_sym].permit!]
    end
  end

  index do
    selectable_column
    actions
    id_column
    column :error_string
    column :o_id
    column :is_changed
    column :name
    column :profit_control_mode, &:profit_control_mode_name
  end
end
