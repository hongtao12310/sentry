-- Table "AUTHZ_PATHS_MAPPING" for classes [org.apache.sentry.provider.db.service.model.MAuthzPathsMapping]
CREATE TABLE "AUTHZ_PATHS_MAPPING"
(
    "AUTHZ_OBJ_ID" SERIAL,
    "AUTHZ_OBJ_NAME" varchar(384) NULL,
    "CREATE_TIME_MS" int8 NOT NULL,
    CONSTRAINT "AUTHZ_PATHS_MAPPING_PK" PRIMARY KEY ("AUTHZ_OBJ_ID")
);

-- Table "MAUTHZPATHSMAPPING_PATHS" for join relationship
CREATE TABLE "MAUTHZPATHSMAPPING_PATHS"
(
    "AUTHZ_OBJ_ID_OID" int8 NOT NULL,
    "PATHS" varchar(4000) NOT NULL,
    CONSTRAINT "MAUTHZPATHSMAPPING_PATHS_PK" PRIMARY KEY ("AUTHZ_OBJ_ID_OID","PATHS")
);

-- Constraints for table "AUTHZ_PATHS_MAPPING" for class(es) [org.apache.sentry.provider.db.service.model.MAuthzPathsMapping]
CREATE UNIQUE INDEX "AUTHZOBJNAME" ON "AUTHZ_PATHS_MAPPING" ("AUTHZ_OBJ_NAME");

-- Constraints for table "MAUTHZPATHSMAPPING_PATHS"
ALTER TABLE "MAUTHZPATHSMAPPING_PATHS" ADD CONSTRAINT "MAUTHZPATHSMAPPING_PATHS_FK1" FOREIGN KEY ("AUTHZ_OBJ_ID_OID") REFERENCES "AUTHZ_PATHS_MAPPING" ("AUTHZ_OBJ_ID") INITIALLY DEFERRED ;

CREATE INDEX "MAUTHZPATHSMAPPING_PATHS_N49" ON "MAUTHZPATHSMAPPING_PATHS" ("AUTHZ_OBJ_ID_OID");

------------------------------------------------------------------
-- Sequences and SequenceTables