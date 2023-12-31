class RemoveOldCdrType < ActiveRecord::Migration[7.0]
  def up
    execute %q{
      drop type billing.cdr_v1;
    }
  end

  def down
    execute %q{
    CREATE TYPE billing.cdr_v1 AS (
        id bigint,
        customer_id integer,
        vendor_id integer,
        customer_acc_id integer,
        vendor_acc_id integer,
        customer_auth_id integer,
        destination_id integer,
        dialpeer_id integer,
        orig_gw_id integer,
        term_gw_id integer,
        routing_group_id integer,
        rateplan_id integer,
        destination_next_rate numeric,
        destination_fee numeric,
        dialpeer_next_rate numeric,
        dialpeer_fee numeric,
        time_limit character varying,
        internal_disconnect_code integer,
        internal_disconnect_reason character varying,
        disconnect_initiator_id integer,
        customer_price numeric,
        vendor_price numeric,
        duration integer,
        success boolean,
        vendor_billed boolean,
        customer_billed boolean,
        profit numeric,
        dst_prefix_in character varying,
        dst_prefix_out character varying,
        src_prefix_in character varying,
        src_prefix_out character varying,
        time_start timestamp without time zone,
        time_connect timestamp without time zone,
        time_end timestamp without time zone,
        sign_orig_ip character varying,
        sign_orig_port integer,
        sign_orig_local_ip character varying,
        sign_orig_local_port integer,
        sign_term_ip character varying,
        sign_term_port integer,
        sign_term_local_ip character varying,
        sign_term_local_port integer,
        orig_call_id character varying,
        term_call_id character varying,
        vendor_invoice_id integer,
        customer_invoice_id integer,
        local_tag character varying,
        dump_file character varying,
        destination_initial_rate numeric,
        dialpeer_initial_rate numeric,
        destination_initial_interval integer,
        destination_next_interval integer,
        dialpeer_initial_interval integer,
        dialpeer_next_interval integer,
        destination_rate_policy_id integer,
        routing_attempt integer,
        is_last_cdr boolean,
        lega_disconnect_code integer,
        lega_disconnect_reason character varying,
        pop_id integer,
        node_id integer,
        src_name_in character varying,
        src_name_out character varying,
        diversion_in character varying,
        diversion_out character varying,
        lega_rx_payloads character varying,
        lega_tx_payloads character varying,
        legb_rx_payloads character varying,
        legb_tx_payloads character varying,
        legb_disconnect_code integer,
        legb_disconnect_reason character varying,
        dump_level_id integer,
        auth_orig_ip inet,
        auth_orig_port integer,
        lega_rx_bytes integer,
        lega_tx_bytes integer,
        legb_rx_bytes integer,
        legb_tx_bytes integer,
        global_tag character varying
    );
    }
  end
end
