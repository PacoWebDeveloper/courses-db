--Users
INSERT INTO users (id, name, last_name, age, email, PASSWORD)
VALUES ('b4480089-de6f-4191-8246-c72f648f1f6d','Brian', 'Ortiz', 28, 'pacoortiz16@hotmail.com','Paco123');
INSERT INTO users (id, name, last_name, age, email, PASSWORD)
VALUES ('dc1d0e7d-0e91-4165-8a1c-0c3658e84b91','Perla','Mendez',27,'perla@gmail.com','Perla123');

--Pay methods
INSERT INTO users_pay_methods (id, owner, bank, card_number, expiration_month, expiration_year, security_code)
VALUES ('294f8491-e63e-4ea4-853d-50a3dfa38d59','Brian Francisco Ortiz Mata','Bank corp','4321876512345678','5','23',456);
INSERT INTO users_pay_methods (id, owner, bank, card_number, expiration_month, expiration_year, security_code)
VALUES ('eda12bba-9f39-4e48-bfea-1d50770509ec','Perla Mendez Solis','Bank corp','2345678998765432','7','25',467);

--Categories
INSERT INTO categories ("name") VALUES ('programming');
INSERT INTO categories ("name") VALUES ('Design');

--Videos
INSERT INTO courses_videos (id, title, url) VALUES ('f5c1b21a-10b4-4157-b1f1-e6952c960e00', 'Install NodeJS', 'https://course.com/install-nodejs');
INSERT INTO courses_videos (id, title, url) VALUES ('234d2e65-9568-493f-918f-55d7a39784fc', 'Web design', 'https://course.com/web-design');

--Teachers
INSERT INTO teachers (id, name, last_name, email) VALUES ('e78a7e5b-359b-414c-8034-936d90ab592a', 'Sahid', 'Kick', 'shaid_kick@academlo.com');
INSERT INTO teachers (id, name, last_name, email) VALUES ('b27a195c-170a-4524-ac1d-e97dfe67a23b', 'Ana', 'Belman', 'ana.belman@academlo.com');

--Courses
INSERT INTO courses (id, title, description, "level", category_id, course_video_id, teacher_id) 
VALUES ('de50c418-2eef-4e14-81b3-0d9347bf38e8','NodeJS','This is the most backend course','H',1,'f5c1b21a-10b4-4157-b1f1-e6952c960e00','e78a7e5b-359b-414c-8034-936d90ab592a');
INSERT INTO courses (id, title, description, "level", category_id, course_video_id, teacher_id)
VALUES ('ad864a9b-6815-46e1-bd81-10d743950f17','Design web sites','Learn to create awesome web site designs','M',2,'234d2e65-9568-493f-918f-55d7a39784fc','b27a195c-170a-4524-ac1d-e97dfe67a23b');

--Courses stack
INSERT INTO courses_stack (id, user_id) VALUES ('8d638a54-55a8-4401-975b-5cbf587669b6','b4480089-de6f-4191-8246-c72f648f1f6d');
INSERT INTO courses_stack (id, user_id) VALUES ('485a0b2b-dc97-4a90-beb1-be9b2ac74b3e','dc1d0e7d-0e91-4165-8a1c-0c3658e84b91');

--Courses list
INSERT INTO courses_list (id, courses_stack_id, course_id) 
VALUES ('ac678675-7324-4001-a7c2-69923965be22','8d638a54-55a8-4401-975b-5cbf587669b6','de50c418-2eef-4e14-81b3-0d9347bf38e8');
INSERT INTO courses_list (id, courses_stack_id, course_id)
VALUES ('8d0e4ae9-deac-4eb7-8f93-5be887b50b1f','485a0b2b-dc97-4a90-beb1-be9b2ac74b3e','ad864a9b-6815-46e1-bd81-10d743950f17');

--Gets course that user is taking and teacher's data
SELECT u.name, c.title, t."name", t.email FROM users u 
INNER JOIN courses_stack cs ON u.id = cs.user_id 
INNER JOIN courses_list cl ON cs.id = cl.courses_stack_id 
INNER JOIN courses c ON cl.course_id = c.id 
INNER JOIN teachers t ON t.id = c.teacher_id;

SELECT * FROM categories c ;