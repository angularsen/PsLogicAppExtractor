﻿---
external help file: PsLogicAppExtractor-help.xml
Module Name: PsLogicAppExtractor
online version:
schema: 2.0.0
---

# Remove-ArmVariable

## SYNOPSIS
Remove variable from the ARM template

## SYNTAX

```
Remove-ArmVariable [-InputObject] <Object> [-Name] <String> [<CommonParameters>]
```

## DESCRIPTION
Removes an ARM template variable by the name provided

## EXAMPLES

### EXAMPLE 1
```
Remove-ArmVariable -InputObject $armObj -Name "logicAppName"
```

Removes the logicAppName ARM template variable

## PARAMETERS

### -InputObject
The ARM object that you want to work against

It has to be a object of the type \[ArmTemplate\] for it to work properly

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: True
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Name of the variable that you want to work against

If the variable exists, it will be removed from the InputObject

```yaml
Type: String
Parameter Sets: (All)
Aliases: VariableName

Required: True
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Author: Mötz Jensen (@Splaxi)

## RELATED LINKS
