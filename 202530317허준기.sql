//���̺� ����
create TABLE tcity
(
    name CHAR(10)  PRIMARY KEY,
    area INT NULL ,
    popu INT NULL ,
    metro CHAR(1) NOT NULL,
    region CHAR(6) NOT NULL
    );
    //������ ���� 
    INSERT INTO tCIty VALUES ('����',604,974,'y','���');
    INSERT INTO tCIty VALUES ('�λ�',765,342,'y','���');
    INSERT INTO tCIty VALUES ('����',42,21,'n','���');
    INSERT INTO tCIty VALUES ('û��',940,83,'n','��û');
    INSERT INTO tCIty VALUES ('����',205,65,'n','����');
    INSERT INTO tCIty VALUES ('��õ',910,27,'n','����');
    INSERT INTO tCIty VALUES ('��õ',1116,27,'n','����');
    INSERT INTO tCIty VALUES ('ȫõ',1819,7,'n','����');
    //������ �˻� 
    SELECT * from tCity;
    