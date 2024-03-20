<?php
require_once "db.php";
include("auth_session.php");
// Fetch all courses to populate the dropdown
$student_query = mysqli_query($conn, "SELECT * FROM students");
if (!$student_query) {
    die("Query failed: " . mysqli_error($conn));
}

// Check if form is submitted
if(isset($_POST['save'])) {
    $attendance_status = $_POST['attendance_status'];
    $attendance_date = date("Y-m-d H:i:s"); // Time auto-generated
    $student_id = $_POST['student_id'];
    $attendance_id = $_GET['id']; // Get attendance ID from URL

    // Update attendance record in the database
    $sql = "UPDATE attendances SET attendance_status='$attendance_status', attendance_date='$attendance_date', student_id='$student_id' WHERE id='$attendance_id'";

    if (mysqli_query($conn, $sql)) {
        echo '<script>alert("Student Attendance has been updated.")</script>';
        echo "<script>window.location.href ='attendance_table.php'</script>";
    } else {
        echo "Error: " . $sql . " " . mysqli_error($conn);
    }
    mysqli_close($conn);
}

// Fetch existing attendance data based on the ID passed via GET
$attendance_id = $_GET['id'];
$attendance_query = mysqli_query($conn, "SELECT * FROM attendances WHERE id='$attendance_id'");
if (!$attendance_query) {
    die("Query failed: " . mysqli_error($conn));
}
$attendance_data = mysqli_fetch_assoc($attendance_query);
?>


<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <title>Form Examples | Bootstrap Based Admin Template - Material Design</title>
    <!-- Favicon-->
    <link rel="icon" href="includes/favicon.ico" type="image/x-icon">

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:400,700&subset=latin,cyrillic-ext" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet" type="text/css">

    <!-- Bootstrap Core Css -->
    <link href="includes/plugins/bootstrap/css/bootstrap.css" rel="stylesheet">

    <!-- Waves Effect Css -->
    <link href="includes/plugins/node-waves/waves.css" rel="stylesheet" />

    <!-- Animation Css -->
    <link href="includes/plugins/animate-css/animate.css" rel="stylesheet" />

    <!-- Sweet Alert Css -->
    <link href="includes/plugins/sweetalert/sweetalert.css" rel="stylesheet" />

    <!-- Custom Css -->
    <link href="includes/css/style.css" rel="stylesheet">

    <!-- AdminBSB Themes. You can choose a theme from css/themes instead of get all themes -->
    <link href="includes/css/themes/all-themes.css" rel="stylesheet" />

<!-- Bootstrap Select Css -->
<link href="includes/plugins/bootstrap-select/css/bootstrap-select.css" rel="stylesheet" />
</head>

<body class="theme-red">
<?php include ("nav.php");   ?>


    <section class="content">
        <div class="container-fluid">
            <div class="block-header">
                <h2>FORM EXAMPLES</h2>
            </div>

            <!-- Vertical Layout -->
            <div class="row clearfix">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="card">
                        <div class="header">
                            <h2>
                                VERTICAL LAYOUT
                            </h2>
                            <ul class="header-dropdown m-r--5">
                                <li class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                        <i class="material-icons">more_vert</i>
                                    </a>
                                    <ul class="dropdown-menu pull-right">
                                        <li><a href="javascript:void(0);">Action</a></li>
                                        <li><a href="javascript:void(0);">Another action</a></li>
                                        <li><a href="javascript:void(0);">Something else here</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <div class="body">
                        <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]) . '?id=' . $attendance_id; ?>" method="post">
    <div class="form-group">
        <div class="col-md-12">
            <p><b>Select Course</b></p>
            <select class="form-control show-tick" data-live-search="true" name="student_id" id="course">
                <option value="">Select Course</option>
                <?php while ($student = mysqli_fetch_assoc($student_query)): ?>
                    <option value="<?= htmlspecialchars($student['id']) ?>" <?= ($attendance_data['student_id'] == $student['id']) ? 'selected' : ''; ?>>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?= htmlspecialchars($student['name']) ?>
                    </option>
                <?php endwhile; ?>
            </select>
        </div>
        <div class="col-md-12">
            <p><b>Select Attendance Status</b></p>
            <select class="form-control show-tick" data-live-search="true" name="attendance_status">
                <option value="">Select Attendace Status</option>
                <option value="PRESENT" <?= ($attendance_data['attendance_status'] == 'PRESENT') ? 'selected' : ''; ?>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Present</option>
                <option value="EXCUSED" <?= ($attendance_data['attendance_status'] == 'EXCUSED') ? 'selected' : ''; ?>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Excused</option>
                <option value="ABSENT" <?= ($attendance_data['attendance_status'] == 'ABSENT') ? 'selected' : ''; ?>>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Absent</option>
            </select>
        </div>
    </div>
    <input type="submit" class="btn btn-primary m-t-15 waves-effect" name="save" value="Submit">
    <a href="attendance_table.php" class="btn btn-danger m-t-15 waves-effect">Cancel</a>
</form>
                        </div>
                    </div>
                </div>
            </div>
            <!-- #END# Vertical Layout -->
        </div>
    </section>

    <!-- Jquery Core Js -->
    <script src="includes/plugins/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core Js -->
    <script src="includes/plugins/bootstrap/js/bootstrap.js"></script>

    <!-- Select Plugin Js -->
    <script src="includes/plugins/bootstrap-select/js/bootstrap-select.js"></script>

    <!-- Slimscroll Plugin Js -->
    <script src="includes/plugins/jquery-slimscroll/jquery.slimscroll.js"></script>

    <!-- Waves Effect Plugin Js -->
    <script src="includes/plugins/node-waves/waves.js"></script>

    <!-- Custom Js -->
    <script src="includes/js/admin.js"></script>

    <!-- Demo Js -->
    <script src="includes/js/demo.js"></script>

    <!-- Select Plugin Js -->
    <script src="includes/plugins/bootstrap-select/js/bootstrap-select.js"></script>
</body>

</html>
