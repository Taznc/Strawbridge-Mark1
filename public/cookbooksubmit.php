<?php
/* Mailer with Attachments */

$action = "send";
global $action;

function showForm() {
/*?>

  <form enctype="multipart/form-data" name="send" method="post" action="<?=$_SERVER['PHP_SELF']?>">
  <input type="hidden" name="action" value="send" />
  <input type="hidden" name="MAX_FILE_SIZE" value="10" />
    <p>Recipient Name: <input name="to_name" size="50" />
    Recipient Email: <input name="to_email" size="50" />
    From Name:  <input name="from_name" size="50" />
    From Email:  <input name="from_email" size="50" />
    Subject:  <input name="subject" size="50" />
    Message: <textarea name="body" rows="10" cols="50"></textarea>
    Attachment: <input type="file" name="attachment" size="50" />
    <input type="submit" value="Send Email" /></p>
  
<?php */
}

function sendMail() {
    $to_name = "Cookbook Creator";
    $from_name = "Contact Form";
    $subject = "Recipe Submission";
	$recipe_name = $_POST['recipe_name'];
	$full_name = $_POST['full_name'];
	$email = $_POST['email'];
	$qty1 = $_POST['qty1'];
	$measurement1 = $_POST['Measurement1'];
	$ingredient1 = $_POST['Ingredient1'];
	$qty2 = $_POST['qty2'];
	$measurement2 = $_POST['Measurement2'];
	$ingredient2 = $_POST['Ingredient2'];
	$qty3 = $_POST['qty3'];
	$measurement3 = $_POST['Measurement3'];
	$ingredient3 = $_POST['Ingredient3'];
	$qty4 = $_POST['qty4'];
	$measurement4 = $_POST['Measurement4'];
	$ingredient4 = $_POST['Ingredient4'];
	$qty5 = $_POST['qty5'];
	$measurement5 = $_POST['Measurement5'];
	$ingredient5 = $_POST['Ingredient5'];
	$qty6 = $_POST['qty6'];
	$measurement6 = $_POST['Measurement6'];
	$ingredient6 = $_POST['Ingredient6'];
	$qty7 = $_POST['qty7'];
	$measurement7 = $_POST['Measurement7'];
	$ingredient7 = $_POST['Ingredient7'];
	$qty8 = $_POST['qty8'];
	$measurement8 = $_POST['Measurement8'];
	$ingredient8 = $_POST['Ingredient8'];
	$qty9 = $_POST['qty9'];
	$measurement9 = $_POST['Measurement9'];
	$ingredient9 = $_POST['Ingredient9'];
	$qty10 = $_POST['qty10'];
	$measurement10 = $_POST['Measurement10'];
	$ingredient10 = $_POST['Ingredient10'];
	$qty11 = $_POST['qty11'];
	$measurement11 = $_POST['Measurement11'];
	$ingredient11 = $_POST['Ingredient11'];
	$qty12 = $_POST['qty12'];
	$measurement12 = $_POST['Measurement12'];
	$ingredient12 = $_POST['Ingredient12'];
	$qty13 = $_POST['qty13'];
	$measurement13 = $_POST['Measurement13'];
	$ingredient13 = $_POST['Ingredient13'];
	$qty14 = $_POST['qty14'];
	$measurement14 = $_POST['Measurement14'];
	$ingredient14 = $_POST['Ingredient14'];
	$qty15 = $_POST['qty15'];
	$measurement15 = $_POST['Measurement15'];
	$ingredient15 = $_POST['Ingredient15'];
	$qty16 = $_POST['qty16'];
	$measurement16 = $_POST['Measurement16'];
	$ingredient16 = $_POST['Ingredient16'];
	$qty17 = $_POST['qty17'];
	$measurement17 = $_POST['Measurement17'];
	$ingredient17 = $_POST['Ingredient17'];
	$qty18 = $_POST['qty18'];
	$measurement18 = $_POST['Measurement18'];
	$ingredient18 = $_POST['Ingredient18'];
	$qty19 = $_POST['qty19'];
	$measurement19 = $_POST['Measurement19'];
	$ingredient19 = $_POST['Ingredient19'];
	$qty20 = $_POST['qty20'];
	$measurement20 = $_POST['Measurement20'];
	$ingredient20 = $_POST['Ingredient20'];
	
    $body = stripslashes($_POST['Instructions']);
    $to_email = "cookbooks@strawbridge.net";
    $attachment = $_FILES['attachment']['tmp_name'];
    $attachment_name = $_FILES['attachment']['name']; 
    if (is_uploaded_file($attachment)) { //Do we have a file uploaded?
      $fp = fopen($attachment, "rb"); //Open it
      $data = fread($fp, filesize($attachment)); //Read it
      $data = chunk_split(base64_encode($data)); //Chunk it up and encode it as base64 so it can emailed
        fclose($fp);
    }
    //Let's start our headers
    $headers = "From: $from_name<" . "contactform@strawbridge.net" . ">\n";
    $headers .= "Reply-To: <" . "contactform@strawbridge.net" . ">\n"; 
    $headers .= "MIME-Version: 1.0\n";
    $headers .= "Content-Type: multipart/related; type=\"multipart/alternative\"; boundary=\"----=MIME_BOUNDRY_main_message\"\n"; 
    $headers .= "X-Sender: $from_name<" . "contactform@strawbridge.net" . ">\n";
    $headers .= "X-Mailer: PHP4\n";
    $headers .= "X-Priority: 3\n"; //1 = Urgent, 3 = Normal
    $headers .= "Return-Path: <" . "contactform@strawbridge.net" . ">\n"; 
    $headers .= "This is a multi-part message in MIME format.\n";
    $headers .= "------=MIME_BOUNDRY_main_message \n"; 
    $headers .= "Content-Type: multipart/alternative; boundary=\"----=MIME_BOUNDRY_message_parts\"\n"; 
    
    $message = "------=MIME_BOUNDRY_message_parts\n";
    $message .= "Content-Type: text/plain; charset=\"iso-8859-1\"\n"; 
    $message .= "Content-Transfer-Encoding: quoted-printable\n"; 
    $message .= "\n"; 
    /* Add our message, in this case it's plain text.  You could also add HTML by changing the Content-Type to text/html */
	$message .= "Recipe Name: $recipe_name\n";
	$message .= "Full Name: $full_name\n";
	$message .= "Email: $email\n\n\n";
	$message .= "$qty1	$measurement1	$ingredient1\n";
	$message .= "$qty2	$measurement2	$ingredient2\n";
	$message .= "$qty3	$measurement3	$ingredient3\n";
	$message .= "$qty4	$measurement4	$ingredient4\n";
	$message .= "$qty5	$measurement5	$ingredient5\n";
	$message .= "$qty6	$measurement6	$ingredient6\n";
	$message .= "$qty7	$measurement7	$ingredient7\n";
	$message .= "$qty8	$measurement8	$ingredient8\n";
	$message .= "$qty9	$measurement9	$ingredient9\n";
	$message .= "$qty10	$measurement10	$ingredient10\n";
	$message .= "$qty11	$measurement11	$ingredient11\n";
	$message .= "$qty12	$measurement12	$ingredient12\n";
	$message .= "$qty13	$measurement13	$ingredient13\n";
	$message .= "$qty14	$measurement14	$ingredient14\n";
	$message .= "$qty15	$measurement15	$ingredient15\n";
	$message .= "$qty16	$measurement16	$ingredient16\n";
	$message .= "$qty17	$measurement17	$ingredient17\n";
	$message .= "$qty18	$measurement18	$ingredient18\n";
	$message .= "$qty19	$measurement19	$ingredient19\n";
	$message .= "$qty20	$measurement20	$ingredient20\n";
	$message .= "\n\n\n$body\n";
    $message .= "\n"; 
    $message .= "------=MIME_BOUNDRY_message_parts--\n"; 
    $message .= "\n"; 
    $message .= "------=MIME_BOUNDRY_main_message\n"; 
    $message .= "Content-Type: application/octet-stream;\n\tname=\"" . $attachment_name . "\"\n";
    $message .= "Content-Transfer-Encoding: base64\n";
    $message .= "Content-Disposition: attachment;\n\tfilename=\"" . $attachment_name . "\"\n\n";
    $message .= $data; //The base64 encoded message
    $message .= "\n"; 
    $message .= "------=MIME_BOUNDRY_main_message--\n"; 

    // send the message
    mail("$to_name<$to_email>", $subject, $message, $headers); 
    print "Cookbook submission has been sent. Thank you.";
  
}

?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
  <head>
    <style="css" type="text/css">
      <!--
      body {
        margin: 0px;
        font-family: Verdana, Arial, Helvetica, sans-serif;
        font-size: 12px;
      }
      a {color: #0000ff}
      -->
    </style>
  </head>
  <body>

<?php
switch ($action) {
  case "send":
    sendMail();
    showForm();
    break;
  default:
    showForm();
}
?>

  </body>
</html>