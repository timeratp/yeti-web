# frozen_string_literal: true

RSpec.describe BatchUpdateForm::NumberList do
  let!(:mode_id) { Routing::Numberlist::MODE_STRICT }
  let!(:default_action_id) { Routing::Numberlist::DEFAULT_ACTION_ACCEPT }
  let!(:lua_script) { FactoryBot.create :lua_script }
  let!(:assign_params) do
    {
      mode_id: mode_id.to_s,
      default_action_id: default_action_id.to_s,
      default_src_rewrite_rule: 'string',
      default_src_rewrite_result: 'string',
      default_dst_rewrite_rule: 'string',
      default_dst_rewrite_result: 'string',
      lua_script_id: lua_script.id.to_s
    }
  end

  subject do
    form = described_class.new(assign_params)
    form.valid?
    form
  end

  describe 'validation' do
    it 'should be valid' do expect(subject).to be_valid end
  end
end
