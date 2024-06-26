# frozen_string_literal: true

RSpec.shared_examples :jsonapi_filters_by_uuid_field do |attr_name|
  describe "by #{attr_name}" do
    include_context :ransack_filter_setup

    context 'equal operator' do
      let(:filter_key) { "#{attr_name}_eq" }
      let(:filter_value) { suitable_record.reload.try attr_name }
      let!(:suitable_record) { create_record }
      let!(:other_record) { create_record }

      before { subject }

      it { expect(response_ids).to include primary_key_for(suitable_record) }
      it { expect(response_ids).not_to include primary_key_for(other_record) }
    end

    context 'not equal operator' do
      let(:filter_key) { "#{attr_name}_not_eq" }
      let(:filter_value) { other_record.reload.try attr_name }
      let!(:suitable_record) { create_record }
      let!(:other_record) { create_record }

      before { subject }

      it { expect(response_ids).to include primary_key_for(suitable_record) }
      it { expect(response_ids).not_to include primary_key_for(other_record) }
    end

    context 'in operator' do
      let(:filter_key) { "#{attr_name}_in" }
      let(:filter_value) { [suitable_record.reload.try(attr_name), SecureRandom.uuid].join(',') }
      let!(:suitable_record) { create_record }
      let!(:other_record) { create_record }

      before { subject }

      it { expect(response_ids).to include primary_key_for(suitable_record) }
      it { expect(response_ids).not_to include primary_key_for(other_record) }
    end

    context 'not_in operator' do
      let(:filter_key) { "#{attr_name}_not_in" }
      let(:filter_value) { [other_record.reload.try(attr_name), SecureRandom.uuid].join(',') }
      let!(:suitable_record) { create_record }
      let!(:other_record) { create_record }

      before { subject }

      it { expect(response_ids).to include primary_key_for(suitable_record) }
      it { expect(response_ids).not_to include primary_key_for(other_record) }
    end
  end
end
