class RemoveVersionTableFromCdr < ActiveRecord::Migration[4.2]

  def up
    execute %q{
      drop table sys.version;
    }
  end

  def down
    execute %q{
      create table sys.version(
        id bigserial primary key,
        number integer not null unique,
        apply_date timestamptz not null default now(),
        comment varchar
      );
    }
  end

end

