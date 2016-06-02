CREATE TABLE accounts (
  id serial primary key,
  last_name text,
  first_name text,
  username text NOT NULL,
  status text DEFAULT 'student' NOT NULL,
  created timestamp with time zone DEFAULT now() NOT NULL,
  updated timestamp with time zone
);

CREATE TABLE gyms (
  id serial primary key,
  created timestamp with time zone DEFAULT now() NOT NULL,
  updated timestamp with time zone
);

CREATE TABLE courts (
  id serial primary key,
  created timestamp with time zone DEFAULT now() NOT NULL,
  updated timestamp with time zone
);

CREATE TABLE slots (
  id serial primary key,
  created timestamp with time zone DEFAULT now() NOT NULL,
  updated timestamp with time zone
);

CREATE TABLE activities (
  id serial primary key,
  created timestamp with time zone DEFAULT now() NOT NULL,
  updated timestamp with time zone
);

CREATE TABLE accounts_slots_activities (
  id serial primary key,
  account_id integer NOT NULL REFERENCES accounts (id),
  slot_id integer NOT NULL REFERENCES slots (id),
  activity_id integer NOT NULL REFERENCES activities (id),
  created timestamp with time zone DEFAULT now() NOT NULL,
  updated timestamp with time zone
);

CREATE TABLE courts_slots (
  id serial primary key,
  court_id integer NOT NULL REFERENCES courts (id),
  slot_id integer NOT NULL REFERENCES slots (id),
  created timestamp with time zone DEFAULT now() NOT NULL,
  updated timestamp with time zone
);

CREATE TABLE accounts_activities (
  id serial primary key,
  account_id integer NOT NULL REFERENCES accounts (id),
  activity_id integer NOT NULL REFERENCES activities (id),
  created timestamp with time zone DEFAULT now() NOT NULL,
  updated timestamp with time zone
);

CREATE TABLE accounts_gyms (
  id serial primary key,
  account_id integer NOT NULL REFERENCES accounts (id),
  gym_id integer NOT NULL REFERENCES gyms (id),
  created timestamp with time zone DEFAULT now() NOT NULL,
  updated timestamp with time zone
);

CREATE TABLE gyms_courts (
  id serial primary key,
  gym_id integer NOT NULL REFERENCES gyms (id),
  court_id integer NOT NULL REFERENCES courts (id),
  created timestamp with time zone DEFAULT now() NOT NULL,
  updated timestamp with time zone
);
