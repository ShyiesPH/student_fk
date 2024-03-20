


<?php
include_once 'db.php';
if(isset($_GET["id"])) {
    if (isset($_GET['confirmed']) && $_GET['confirmed'] == 'true') {
        $sql = "DELETE FROM attendances WHERE id='" . $_GET["id"] . "'";
        if (mysqli_query($conn, $sql)) {
           
            mysqli_close($conn);
        } else {
            echo "Error: " . $sql . "<br>" . mysqli_error($conn);
        }
    } else {
        echo '<script>
            if (confirm("Are you sure you want to delete this student attendance?")) {
                window.location.href = "attendance_delete.php?id=' . $_GET['id'] . '&confirmed=true";
                window.location.href = "attendance_table.php";
            } else {
                window.location.href = "attendance_table.php";
            }
        </script>';
    }
}
?>
