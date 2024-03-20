
<!DOCTYPE html>
<html>
    <?php
// Include your database connection file here
include 'db.php';

// Check if form is submitted
if(isset($_POST['submit'])) {
    // Retrieve input fields from the form
    $name = $_POST['name'];
    $subjects = $_POST['subject'];

    // Iterate through subjects array and insert into the database
    foreach($subjects as $subject) {
        // Insert subject into the database
        $sql = "INSERT INTO subjects (subject_lists_id, student_id) VALUES ('$subject', '$name')";
        
        if (mysqli_query($conn, $sql)) {
            echo '<script>alert("Subject has been added successfully.")</script>';
        } else {
            echo "Error: " . $sql . " " . mysqli_error($conn);
        }
    }
    mysqli_close($conn);
}
    ?>
  <head>
    <title>Dynamic Fields</title>
    <link rel="stylesheet" type="text/css" href="styles.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
    />
  </head>
  <body>
  <h1>Add Subject</h1>
<div class="container">
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="POST">
        <div id="formfield">
            <input type="text" name="name" class="text" size="50" placeholder="Name" required>
            <input type="text" name="subject[]" class="text" size="50" placeholder="Subject">
        </div>
        <input name="submit" type="submit" value="Submit">
    </form>
    <div class="controls">
        <button class="add" onclick="add()"><i class="fa fa-plus"></i>Add</button>
        <button class="remove" onclick="remove()"><i class="fa fa-minus"></i>Remove</button>
    </div>
</div>

<script>
    var formfield = document.getElementById('formfield');

    function add() {
        var newField = document.createElement('input');
        newField.setAttribute('type', 'text');
        newField.setAttribute('name', 'subject[]');
        newField.setAttribute('class', 'text');
        newField.setAttribute('siz', 50);
        newField.setAttribute('placeholder', 'Subject');
        formfield.appendChild(newField);
    }

    function remove() {
        var input_tags = formfield.getElementsByTagName('input');
        if (input_tags.length > 2) {
            formfield.removeChild(input_tags[(input_tags.length) - 1]);
        }
    }
</script>
  </body>
</html>