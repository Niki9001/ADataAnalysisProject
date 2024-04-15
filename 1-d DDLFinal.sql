Create database HuggingFace2
use huggingface2
CREATE TABLE Model (
  ID bigint(19) NOT NULL,
  pipeline varchar(10) NULL,
  lastModified int(10) NULL,
  Model_name varchar(255) NOT NULL,
  PRIMARY KEY (ID)
);

CREATE TABLE Model_predict (
  Model_predict_id int(10) NOT NULL,
  model_id bigint(19) NOT NULL,
  predict_id int(10) NOT NULL,
  PRIMARY KEY (Model_predict_id),
  FOREIGN KEY (model_id) REFERENCES Model(ID)
);

CREATE TABLE Predict_downloads (
  Predict_id int(10) NOT NULL,
  downloads int(10) NULL,
  date_id int(10) NULL,
  Model_predictModel_predict_id int(10) NOT NULL,
  PRIMARY KEY (Predict_id),
  FOREIGN KEY (Model_predictModel_predict_id) REFERENCES Model_predict(Model_predict_id)
);

CREATE TABLE Model_metrics (
  Model_metrics_id bigint(19) NOT NULL,
  model_id bigint(19) NOT NULL,
  metrics_id bigint(19) NOT NULL,
  PRIMARY KEY (Model_metrics_id),
  FOREIGN KEY (model_id) REFERENCES Model(ID),
  FOREIGN KEY (metrics_id) REFERENCES metrics(metrics_id)
);

CREATE TABLE metrics (
  metrics_id bigint(19) NOT NULL,
  model_metrics_id bigint(19) NOT NULL,
  downloads int(255) NULL,
  likes int(255) NULL,
  date date NULL,
  PRIMARY KEY (metrics_id),
  FOREIGN KEY (model_metrics_id) REFERENCES Model_metrics(Model_metrics_id)
);

CREATE TABLE Model_tags (
  model_tags_id int(10) NOT NULL,
  model_id bigint(19) NOT NULL,
  tags_id int(20) NOT NULL,
  PRIMARY KEY (model_tags_id),
  FOREIGN KEY (model_id) REFERENCES Model(ID),
  FOREIGN KEY (tags_id) REFERENCES Tags(tags_id)
);

CREATE TABLE Tags (
  tags_id int(20) NOT NULL,
  tag_name varchar(255) NOT NULL,
  PRIMARY KEY (tags_id)
);
