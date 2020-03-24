create table user
(
    id   bigint auto_increment primary key,
    name varchar(255)
);

create table device
(
    id      bigint auto_increment primary key,
    name    varchar(255),
    user_id bigint not null,

    constraint fk_device_user_id foreign key (user_id) references user (id)
);

create table authentication
(
    id          bigint auto_increment primary key,
    description varchar(255),
    device_id   bigint not null,

    constraint fk_authentication_device_id foreign key (device_id) references device (id)
);

create table challenge
(
    id                bigint auto_increment primary key,
    token             varchar(68),
    authentication_id bigint,

    constraint fk_challenge_authentication_id foreign key (authentication_id) references authentication (id)
)

