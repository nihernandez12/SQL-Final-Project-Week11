DROP TABLE IF EXISTS material;
DROP TABLE IF EXISTS step;
DROP TABLE IF EXISTS project_category;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS project;

CREATE TABLE project(
	project_id INT AUTO_INCREMENT NOT NULL,
	project_name VARCHAR(128) NOT NULL,
	estimated_hours DECIMAL(7, 2),
	actual_hours DECIMAL(7, 2),
	difficulty INT,
	notes TEXT,
	PRIMARY KEY (project_id)
);

CREATE TABLE category(
	category_id INT AUTO_INCREMENT NOT NULL,
	category_name VARCHAR(128) NOT NULL,
	PRIMARY KEY (category_id)
);

CREATE TABLE project_category (
	project_id INT NOT NULL,
	category_id INT NOT NULL,
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE,
	FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE,
	UNIQUE KEY (project_id, category_id)
);

CREATE TABLE step(
	step_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	step_text TEXT NOT NULL,
	step_order INT NOT NULL,
	PRIMARY KEY (step_id),
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

CREATE TABLE material(
	material_id INT AUTO_INCREMENT NOT NULL,
	project_id INT NOT NULL,
	material_name VARCHAR(128) NOT NULL,
	num_required INT,
	cost DECIMAL(7, 2),
	PRIMARY KEY (material_id),
	FOREIGN KEY (project_id) REFERENCES project (project_id) ON DELETE CASCADE
);

INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Carve a Pumpkin', 2, 1, 2, 'It will get messy!');
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Knife', 1, 10.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Spoon', 4, 1.50);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Pumpkin', 6, 5.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (1, 'Candle', 1, 2.50);
INSERT INTO step (project_id, step_text, Step_order) VALUES (1, 'Use the knife to cut a hole around the stem of the pumpkin', 1);
INSERT INTO step (project_id, step_text, Step_order) VALUES (1, 'Use the spoon to take out the seeds and the insides of the pumpkin', 2);
INSERT INTO step (project_id, step_text, Step_order) VALUES (1, 'Use the knife to cut the design or face into the side of the pumpkin', 3);
INSERT INTO step (project_id, step_text, Step_order) VALUES (1, 'Put the candle inside of the pumpkin', 4);
INSERT INTO category (category_id, category_name) VALUES (1, 'Fall Activities);
INSERT INTO project_category (project_id, category_id) VALUES (1, 1);


INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Thanksgiving Dinner', 8, 6, 3, 'Time to eat!');
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'Turkey', 1, 25.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'Mashed Potatoes', 8, 9.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'Rolls', 25, 4.50);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (2, 'Green Bean Casserole', 1, 5.50);
INSERT INTO step (project_id, step_text, Step_order) VALUES (2, 'Put the turkey in the preheated oven early in the morning', 1);
INSERT INTO step (project_id, step_text, Step_order) VALUES (2, 'Mash the boiled potatoes with butter, salt, and chives', 2);
INSERT INTO step (project_id, step_text, Step_order) VALUES (2, 'Bake the rolls 20 minutes before dinner is ready', 3);
INSERT INTO step (project_id, step_text, Step_order) VALUES (2, 'Bake the premade green bean casserole in ther oven 15 minutes before dinner is ready', 4);
INSERT INTO step (project_id, step_text, Step_order) VALUES (2, 'Serve dinner', 5);
INSERT INTO category (category_id, category_name) VALUES (1, 'Fall Activities');
INSERT INTO project_category (project_id, category_id) VALUES (2, 1);


INSERT INTO project (project_name, estimated_hours, actual_hours, difficulty, notes) VALUES ('Decorate the Front Door', 2, 1, 1, 'Make it look pretty!');
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (3, 'Big Pumpkins', 2, 10.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (3, 'Medium Pumkins', 4, 12.00);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (3, 'Small Pumpkins', 6, 9.50);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (3, 'Fall Sign', 1, 12.50);
INSERT INTO material (project_id, material_name, num_required, cost) VALUES (3, 'Fall Wreath', 1, 22.75);
INSERT INTO step (project_id, step_text, Step_order) VALUES (3, 'Place fall wreath on door', 1);
INSERT INTO step (project_id, step_text, Step_order) VALUES (3, 'Place fall sign on left side by door', 2);
INSERT INTO step (project_id, step_text, Step_order) VALUES (3, 'Place a big pumpkin on each side of door', 3);
INSERT INTO step (project_id, step_text, Step_order) VALUES (3, 'Place two medium pumpkins on each side of the big pumpkins', 4);
INSERT INTO step (project_id, step_text, Step_order) VALUES (3, 'Place three small pumpkins by each big pumpkin', 5);
INSERT INTO category (category_id, category_name) VALUES (2, 'Fall Decorating');
INSERT INTO project_category (project_id, category_id) VALUES (3, 2);




