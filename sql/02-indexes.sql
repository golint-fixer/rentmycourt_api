CREATE INDEX ON accounts_gyms (gym_id);
CREATE INDEX ON accounts_gyms (account_id);

CREATE INDEX ON gyms_courts (gym_id);
CREATE INDEX ON gyms_courts (court_id);

CREATE INDEX ON courts_slots (court_id);
CREATE INDEX ON courts_slots (slot_id);

CREATE INDEX ON accounts_slots_activities (slot_id);
CREATE INDEX ON accounts_slots_activities (account_id);
CREATE INDEX ON accounts_slots_activities (activity_id);

CREATE INDEX ON accounts_activities (activity_id);
CREATE INDEX ON accounts_activities (account_id);
