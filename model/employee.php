<?php
    function getEmployee() {
        global $db;
        $query = 'SELECT employeeID, firstName FROM employee ORDER BY employeeID';
        $statement = $db->prepare($query);
        $statement->execute();
        $employees = $statement;
        return $employees;
    }
?>
<!---------------------------------------------------------------
Modification Log
Date        Name        Description

2/7/2020    EWalter     initial deployment
---------------------------------------------------------------!>