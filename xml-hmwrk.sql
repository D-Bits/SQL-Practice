USE MetroAlt;

CREATE XML SCHEMA COLLECTION MaintenanceNoteSchemaCollection
AS

'
'<?xml version="1.0" encoding="utf-8"?>
<xs:schema attributeFormDefault="unqualified" 
           elementFormDefault="qualified" 
           targetNamespace="http://www.metroalt.com/maintenancenote" 
           xmlns:xs="http://www.w3.org/2001/XMLSchema">
  <xs:element name="maintenancenote">
    <xs:complexType>
      <xs:sequence>
        <xs:element name="title" />
        <xs:element name="note">
          <xs:complexType>
            <xs:sequence>
              <xs:element maxOccurs="unbounded" name="p" />
            </xs:sequence>
          </xs:complexType>
        </xs:element>
        <xs:element name="followup" />
      </xs:sequence>
    </xs:complexType>
  </xs:element>
</xs:schema>'
 '

SELECT * 
FROM MaintenanceDetail

ALTER TABLE MaintenanceDetail 
DROP COLUMN MaintenanceDetailNote

ALTER TABLE MaintenanceDetail 
ADD MaintenanceDetailNote XML(MaintenanceNoteSchemaCollection)

INSERT INTO MaintenanceDetail(
MaintenanceKey, BusServiceKey, EmployeeKey, MaintenanceDetailNote)
VALUES(1,1,9,
'
  tires are wearing fast


  I recommend new tires within  5000 miles



  Schedule replacement for August 2016
')

SELECT * 
FROM MaintenanceDetail

SELECT MaintenanceDetailKey, 
MaintenanceDetailNote.query('declare namespace mn="http://www.metroalt.com/maintenancenote"; 
//mn:maintenancenote/mn:title') 
AS Titles
FROM MaintenanceDetail
