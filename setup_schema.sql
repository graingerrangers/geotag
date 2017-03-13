-- tables
-- Table: Classifieds
CREATE TABLE Classifieds (
    classified_id int NOT NULL,
    description varchar(140) NOT NULL,
    name varchar(30) NOT NULL,
    category varchar(30) NOT NULL,
    price double NOT NULL,
    user_id varchar(30) NOT NULL,
    CONSTRAINT Classifieds_pk PRIMARY KEY (classified_id)
);

-- Table: Events
CREATE TABLE Events (
    event_id int NOT NULL,
    description varchar(140) NOT NULL,
    name varchar(30) NOT NULL,
    start_time date NOT NULL,
    end_time date NOT NULL,
    max_group_size int NOT NULL,
    fee double NOT NULL,
    public boolean NOT NULL,
    host_id varchar(30) NOT NULL,
    location_id int NOT NULL,
    CONSTRAINT Events_pk PRIMARY KEY (event_id)
);

-- Table: Is_Attending
CREATE TABLE Is_Attending (
    user_id varchar(30) NOT NULL,
    event_id int NOT NULL,
    CONSTRAINT Is_Attending_pk PRIMARY KEY (user_id)
);

-- Table: Is_Friend
CREATE TABLE Is_Friend (
    user1_id varchar(30) NOT NULL,
    user2_id varchar(30) NOT NULL,
    CONSTRAINT Is_Friend_pk PRIMARY KEY (user1_id)
);

-- Table: Locations
CREATE TABLE Locations (
    location_id int NOT NULL,
    popularity double NOT NULL,
    coord_x double NOT NULL,
    coord_y double NOT NULL,
    CONSTRAINT Locations_pk PRIMARY KEY (location_id)
);

-- Table: Reviews
CREATE TABLE Reviews (
    review_id int NOT NULL AUTO_INCREMENT,
    content varchar(140) NOT NULL,
    user_id varchar(30) NOT NULL,
    CONSTRAINT Reviews_pk PRIMARY KEY (review_id)
);

-- Table: Users
CREATE TABLE Users (
    fb_id varchar(30) NOT NULL,
    name varchar(30) NOT NULL,
    description varchar(140) NOT NULL,
    CONSTRAINT Users_pk PRIMARY KEY (fb_id)
);

-- foreign keys
-- Reference: created_by (table: Classifieds)
ALTER TABLE Classifieds ADD CONSTRAINT created_by FOREIGN KEY created_by (user_id)
    REFERENCES Users (fb_id);

-- Reference: hosted_by (table: Events)
ALTER TABLE Events ADD CONSTRAINT hosted_by FOREIGN KEY hosted_by (host_id)
    REFERENCES Users (fb_id);

-- Reference: located_at (table: Events)
ALTER TABLE Events ADD CONSTRAINT located_at FOREIGN KEY located_at (location_id)
    REFERENCES Locations (location_id);

-- Reference: reviewed_by (table: Reviews)
ALTER TABLE Reviews ADD CONSTRAINT reviewed_by FOREIGN KEY reviewed_by (user_id)
    REFERENCES Users (fb_id);
