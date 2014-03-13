CREATE TABLE users (id INT AUTO_INCREMENT NOT NULL, username VARCHAR(255) NOT NULL, username_canonical VARCHAR(255) NOT NULL, email VARCHAR(255) NOT NULL, email_canonical VARCHAR(255) NOT NULL, enabled TINYINT(1) NOT NULL, salt VARCHAR(255) NOT NULL, password VARCHAR(255) NOT NULL, last_login DATETIME DEFAULT NULL, locked TINYINT(1) NOT NULL, expired TINYINT(1) NOT NULL, expires_at DATETIME DEFAULT NULL, confirmation_token VARCHAR(255) DEFAULT NULL, password_requested_at DATETIME DEFAULT NULL, roles LONGTEXT NOT NULL COMMENT '(DC2Type:array)', credentials_expired TINYINT(1) NOT NULL, credentials_expire_at DATETIME DEFAULT NULL, registeredAt DATETIME NOT NULL, name VARCHAR(255) DEFAULT NULL, surname VARCHAR(255) DEFAULT NULL, UNIQUE INDEX UNIQ_1483A5E992FC23A8 (username_canonical), UNIQUE INDEX UNIQ_1483A5E9A0D96FBF (email_canonical), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE dataset (DatasetIsMIDAS INT NOT NULL, DatasetTitle VARCHAR(80) NOT NULL, DatasetCreated INT NOT NULL, DatsetFilepPath VARCHAR(255) NOT NULL, DatasetUpdated INT DEFAULT NULL, DatasetDescription VARCHAR(500) DEFAULT NULL, DatasetID INT AUTO_INCREMENT NOT NULL, UserID INT DEFAULT NULL, INDEX IDX_B7A041D058746832 (UserID), UNIQUE INDEX DATASET_PK (DatasetID), PRIMARY KEY(DatasetID)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE experiment (ExperimentName VARCHAR(80) NOT NULL, ExperimentMaxDuration TIME DEFAULT NULL, ExpermentStart INT DEFAULT NULL, ExperimentFinish INT DEFAULT NULL, ExperimentUseCPU INT DEFAULT NULL, ExperimentUsePrimaryMemory INT DEFAULT NULL, ExperimentUseSecMemory INT DEFAULT NULL, ExperimentGUIData LONGTEXT DEFAULT NULL, ExperimentID INT AUTO_INCREMENT NOT NULL, ExperimentStatusID INT DEFAULT NULL, UserID INT DEFAULT NULL, INDEX IDX_136F58B234472C01 (ExperimentStatusID), INDEX IDX_136F58B258746832 (UserID), UNIQUE INDEX EXPERIMENT_PK (ExperimentID), PRIMARY KEY(ExperimentID)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE experimentstatus (ExperimentStatus VARCHAR(80) NOT NULL, ExperimentStatusID INT AUTO_INCREMENT NOT NULL, UNIQUE INDEX EXPERIMENTSTATUS_PK (ExperimentStatusID), PRIMARY KEY(ExperimentStatusID)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE parameter (ParameterName VARCHAR(80) NOT NULL, ParameterIsRequired INT NOT NULL, ParameterDefault VARCHAR(80) DEFAULT NULL, ParameterDescription VARCHAR(500) DEFAULT NULL, ParameterLabelLT VARCHAR(255) DEFAULT NULL, ParameterLabelEN VARCHAR(255) DEFAULT NULL, ParameterID INT AUTO_INCREMENT NOT NULL, ParameterTypeID INT DEFAULT NULL, ParameterConnectionTypeID INT DEFAULT NULL, ComponentID INT DEFAULT NULL, INDEX IDX_2A979110D50E99E0 (ParameterTypeID), INDEX IDX_2A97911010C17FF9 (ParameterConnectionTypeID), INDEX IDX_2A979110C364FDFE (ComponentID), UNIQUE INDEX PARAMETER_PK (ParameterID), PRIMARY KEY(ParameterID)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE parameterconnectiontype (ParameterConnectionType VARCHAR(80) NOT NULL, ParameterConnectionTypeID INT AUTO_INCREMENT NOT NULL, UNIQUE INDEX PARAMETERCONNECTIONTYPE_PK (ParameterConnectionTypeID), PRIMARY KEY(ParameterConnectionTypeID)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE parametertype (ParameterType VARCHAR(80) NOT NULL, ParameterTypeID INT AUTO_INCREMENT NOT NULL, UNIQUE INDEX PARAMETERTYPE_PK (ParameterTypeID), PRIMARY KEY(ParameterTypeID)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE parametervalue (ParameterValue VARCHAR(80) DEFAULT NULL, ParameterValueID INT AUTO_INCREMENT NOT NULL, WorkflowTaskID INT DEFAULT NULL, ParameterID INT DEFAULT NULL, INDEX IDX_EF5C2B2A199F0DB9 (WorkflowTaskID), INDEX IDX_EF5C2B2A5A8577F9 (ParameterID), UNIQUE INDEX PARAMETERVALUE_PK (ParameterValueID), PRIMARY KEY(ParameterValueID)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE pvalueoutpvaluein (InParameterValueID INT NOT NULL, OutParameterValueID INT DEFAULT NULL, INDEX IDX_A522F8AE88C1F20 (OutParameterValueID), PRIMARY KEY(InParameterValueID)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE workflowtask (WorkflowTaskIsRunning INT NOT NULL, WorkflowTaskID INT AUTO_INCREMENT NOT NULL, ExperimentID INT DEFAULT NULL, INDEX IDX_5F598CF2BAA1BE51 (ExperimentID), UNIQUE INDEX WORKFLOWTASK_PK (WorkflowTaskID), PRIMARY KEY(WorkflowTaskID)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE cluster (ClusterName VARCHAR(80) NOT NULL, ClusterWorkloadHost VARCHAR(255) NOT NULL, ClusterDescription VARCHAR(500) DEFAULT NULL, ClusterID INT AUTO_INCREMENT NOT NULL, PRIMARY KEY(ClusterID)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE component (ComponentName VARCHAR(80) NOT NULL, ComponentIcon VARCHAR(255) NOT NULL, ComponentWSDLRunHost VARCHAR(255) NOT NULL, ComponentWSDLCallFunction VARCHAR(80) NOT NULL, ComponentDescription VARCHAR(500) DEFAULT NULL, ComponentAltDescription VARCHAR(80) DEFAULT NULL, ComponentLabelLT VARCHAR(255) DEFAULT NULL, ComponentLabelEN VARCHAR(255) DEFAULT NULL, ComponentID INT AUTO_INCREMENT NOT NULL, ClusterID INT DEFAULT NULL, ComponentTypeID INT DEFAULT NULL, INDEX IDX_49FEA157B26192BE (ClusterID), INDEX IDX_49FEA1576ACDD642 (ComponentTypeID), UNIQUE INDEX COMPONENT_PK (ComponentID), PRIMARY KEY(ComponentID)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE componenttype (ComponentType VARCHAR(80) NOT NULL, ComponentTypeID INT AUTO_INCREMENT NOT NULL, UNIQUE INDEX COMPONENTTYPE_PK (ComponentTypeID), PRIMARY KEY(ComponentTypeID)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE page (id INT AUTO_INCREMENT NOT NULL, title VARCHAR(255) NOT NULL, slug VARCHAR(128) NOT NULL, `group` VARCHAR(255) NOT NULL, groupSlug VARCHAR(128) NOT NULL, text LONGTEXT DEFAULT NULL, position INT NOT NULL, UNIQUE INDEX UNIQ_140AB620989D9B62 (slug), UNIQUE INDEX UNIQ_140AB620F656C5DF (groupSlug), PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
CREATE TABLE entity_log (id INT AUTO_INCREMENT NOT NULL, action VARCHAR(8) NOT NULL, logged_at DATETIME NOT NULL, object_id VARCHAR(64) DEFAULT NULL, object_class VARCHAR(255) NOT NULL, version INT NOT NULL, data LONGTEXT DEFAULT NULL COMMENT '(DC2Type:array)', username VARCHAR(255) DEFAULT NULL, PRIMARY KEY(id)) DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ENGINE = InnoDB;
ALTER TABLE dataset ADD CONSTRAINT FK_B7A041D058746832 FOREIGN KEY (UserID) REFERENCES users (id);
ALTER TABLE experiment ADD CONSTRAINT FK_136F58B234472C01 FOREIGN KEY (ExperimentStatusID) REFERENCES experimentstatus (ExperimentStatusID);
ALTER TABLE experiment ADD CONSTRAINT FK_136F58B258746832 FOREIGN KEY (UserID) REFERENCES users (id);
ALTER TABLE parameter ADD CONSTRAINT FK_2A979110D50E99E0 FOREIGN KEY (ParameterTypeID) REFERENCES parametertype (ParameterTypeID);
ALTER TABLE parameter ADD CONSTRAINT FK_2A97911010C17FF9 FOREIGN KEY (ParameterConnectionTypeID) REFERENCES parameterconnectiontype (ParameterConnectionTypeID);
ALTER TABLE parameter ADD CONSTRAINT FK_2A979110C364FDFE FOREIGN KEY (ComponentID) REFERENCES component (ComponentID);
ALTER TABLE parametervalue ADD CONSTRAINT FK_EF5C2B2A199F0DB9 FOREIGN KEY (WorkflowTaskID) REFERENCES workflowtask (WorkflowTaskID);
ALTER TABLE parametervalue ADD CONSTRAINT FK_EF5C2B2A5A8577F9 FOREIGN KEY (ParameterID) REFERENCES parameter (ParameterID);
ALTER TABLE pvalueoutpvaluein ADD CONSTRAINT FK_A522F8AEF169B8E2 FOREIGN KEY (InParameterValueID) REFERENCES parametervalue (ParameterValueID);
ALTER TABLE pvalueoutpvaluein ADD CONSTRAINT FK_A522F8AE88C1F20 FOREIGN KEY (OutParameterValueID) REFERENCES parametervalue (ParameterValueID);
ALTER TABLE workflowtask ADD CONSTRAINT FK_5F598CF2BAA1BE51 FOREIGN KEY (ExperimentID) REFERENCES experiment (ExperimentID);
ALTER TABLE component ADD CONSTRAINT FK_49FEA157B26192BE FOREIGN KEY (ClusterID) REFERENCES cluster (ClusterID);
ALTER TABLE component ADD CONSTRAINT FK_49FEA1576ACDD642 FOREIGN KEY (ComponentTypeID) REFERENCES componenttype (ComponentTypeID);
