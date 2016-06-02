CREATE OR REPLACE FUNCTION update_modified_column()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated = now();
    RETURN NEW;
END;
$$ language 'plpgsql';

CREATE TRIGGER accounts_modtime BEFORE UPDATE ON accounts FOR EACH ROW EXECUTE PROCEDURE update_modified_column();
CREATE TRIGGER accounts_gyms_modtime BEFORE UPDATE ON accounts_gyms FOR EACH ROW EXECUTE PROCEDURE update_modified_column();
CREATE TRIGGER gyms_modtime BEFORE UPDATE ON gyms FOR EACH ROW EXECUTE PROCEDURE update_modified_column();
CREATE TRIGGER gyms_courts_modtime BEFORE UPDATE ON gyms_courts FOR EACH ROW EXECUTE PROCEDURE update_modified_column();
CREATE TRIGGER courts_modtime BEFORE UPDATE ON courts FOR EACH ROW EXECUTE PROCEDURE update_modified_column();
CREATE TRIGGER courts_slots_modtime BEFORE UPDATE ON courts_slots FOR EACH ROW EXECUTE PROCEDURE update_modified_column();
CREATE TRIGGER slots_modtime BEFORE UPDATE ON slots FOR EACH ROW EXECUTE PROCEDURE update_modified_column();
CREATE TRIGGER accounts_slots_activities_modtime BEFORE UPDATE ON accounts_slots_activities FOR EACH ROW EXECUTE PROCEDURE update_modified_column();
CREATE TRIGGER activities_modtime BEFORE UPDATE ON activities FOR EACH ROW EXECUTE PROCEDURE update_modified_column();
CREATE TRIGGER accounts_activities_modtime BEFORE UPDATE ON accounts_activities FOR EACH ROW EXECUTE PROCEDURE update_modified_column();
