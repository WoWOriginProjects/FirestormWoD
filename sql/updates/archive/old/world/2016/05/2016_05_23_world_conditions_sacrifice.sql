DELETE FROM `conditions` WHERE SourceEntry = 140271;
INSERT INTO `conditions`
            (`SourceTypeOrReferenceId`,
             `SourceGroup`,
             `SourceEntry`,
             `SourceId`,
             `ElseGroup`,
             `ConditionTypeOrReference`,
             `ConditionTarget`,
             `ConditionValue1`,
             `ConditionValue2`,
             `ConditionValue3`,
             `NegativeCondition`,
             `ErrorTextId`,
             `ScriptName`,
             `Comment`)
VALUES ('17',
        '0',
        '140271',
        '0',
        '0',
        '27',
        '0',
        '90',
        '4',
        '0',
        '0',
        '0',
        '',
        'Sacrifice only usable level < 91');