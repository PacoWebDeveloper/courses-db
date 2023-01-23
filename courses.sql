CREATE TABLE "users" (
  "id" uuid PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "age" integer NOT NULL,
  "email" varchar NOT NULL,
  "password" varchar NOT NULL,
  "pay_method_id" uuid
);

CREATE TABLE "users_pay_methods" (
  "id" uuid PRIMARY KEY NOT NULL,
  "owner" varchar NOT NULL,
  "bank" varchar NOT NULL,
  "card_number" varchar(16) NOT NULL,
  "expiration_month" integer NOT NULL,
  "expiration_year" integer NOT NULL,
  "security_code" integer NOT NULL
);

CREATE TABLE "courses" (
  "id" uuid PRIMARY KEY NOT NULL,
  "title" varchar NOT NULL,
  "description" varchar NOT NULL,
  "level" char(1) NOT NULL,
  "category_id" integer NOT NULL,
  "course_video_id" uuid NOT NULL,
  "teacher_id" uuid NOT NULL
);

CREATE TABLE "courses_videos" (
  "id" uuid PRIMARY KEY NOT NULL,
  "title" varchar NOT NULL,
  "url" varchar NOT NULL
);

CREATE TABLE "categories" (
  "id" serial PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL
);

CREATE TABLE "courses_stack" (
  "id" uuid PRIMARY KEY NOT NULL,
  "user_id" uuid NOT NULL
);

CREATE TABLE "courses_list" (
  "id" uuid NOT NULL,
  "courses_stack_id" uuid NOT NULL,
  "course_id" uuid NOT NULL
);

CREATE TABLE "teachers" (
  "id" uuid PRIMARY KEY NOT NULL,
  "name" varchar NOT NULL,
  "last_name" varchar NOT NULL,
  "email" varchar NOT NULL
);

ALTER TABLE "users_pay_methods" ADD FOREIGN KEY ("id") REFERENCES "users" ("pay_method_id");

ALTER TABLE "courses_stack" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "categories" ADD FOREIGN KEY ("id") REFERENCES "courses" ("category_id");

ALTER TABLE "courses_videos" ADD FOREIGN KEY ("id") REFERENCES "courses" ("course_video_id");

ALTER TABLE "teachers" ADD FOREIGN KEY ("id") REFERENCES "courses" ("teacher_id");

ALTER TABLE "courses_list" ADD FOREIGN KEY ("courses_stack_id") REFERENCES "courses_stack" ("id");

ALTER TABLE "courses_list" ADD FOREIGN KEY ("course_id") REFERENCES "courses" ("id");
