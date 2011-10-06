<?php
/*
Script Name: Mail-it Now! Upload2Server
Script URI: http://www.skyminds.net/scripts-php-mysql/
Description: Easy to use form2mail with multiple-uploads functionality.
Version: 1.5.3
Author: Matt Biscay
Author URI: http://www.skyminds.net/
Licence : Copyright 2001-2004 - SkyMinds.Net. All rights reserved. This script is linkware. Contact us for commercial use or custom version.
*/
// ---------------------------------- EDIT HERE --------------------------------- //
	/* Your email where the results of the contact form will be sent to. */
	$dest = "jashworth@mail.strawbridge.net";

	/* The full path to your upload directory. This will appear in the email you'll get so that you can retrieve the uploaded files easily. */
	$up_full = "http://new.strawbridge.net/uploads/Email";
	
	/* The relative path to your upload directory from this script. This is an important settings : if the files are not uploaded, chances are that this is not set properly.
	Configuration example : if this file is at www.domain.net/contact.php and your upload directory is www.domain.net/upload/, the setting should be :
	$up_dir = "./upload/";
	*/
	$up_dir = "./uploads/Email";
	
	/* Home URI of your website */
	$home_url = "http://new.strawbridge.net/";
	
	/*  The number of upload fields you want on the form. Put 0 if you don't want any. */
	$UploadNum = "1";
	
	/*Host mail functions. Possible values are 0 or 1. See below:
	0 is for most hosts (default value). 
	1 is for Online.Net (Online). */
	$online_isp = "0";	
// --------------------------------------------------------------------------------- //

function unique_id()
{
	$taille = 6;
	$new_pass = '';
	$lettres = "abcdefghijklmnpqrstuvwxyz123456789";
	srand(time());
	for ($i=0;$i<$taille;$i++)
	{
		$new_pass.=substr($lettres,(rand()%(strlen($lettres))),1);
	}
	define("timer", $new_pass);
}
unique_id();
ini_set("sendmail_from", $dest);

if(isset($_POST["submit"]))
{
// ------------------------ Fields Verification Process ------------------------- //

	$From = preg_replace("/\r/", "", $_POST['From']); 
	$From = preg_replace("/\n/", "", $From);
	$Name = preg_replace("/\r/", "", $_POST['Name']); 
	$Name = preg_replace("/\n/", "", $Name);
	$Msg  = $_POST['Msg'];
	$Nada = '';
	
	if(empty($From))
	{                 
    		$Nada.="Email field is empty !<br>";
	}
	if(empty($Msg))
	{
    		$Nada.="Message field is empty !<br>";
	}
	$noway = "$Nada" ;
	
	if(empty($Nada) && 
	eregi("^[a-z0-9]+([_.-][a-z0-9]+)*@([a-z0-9]+([.-][a-z0-9]+)*)+\\.[a-z]{2,4}$",$From))
	{
		$ok = TRUE;
	}
	elseif(!empty($Nada) && 
	eregi("^[a-z0-9]+([_.-][a-z0-9]+)*@([a-z0-9]+([.-][a-z0-9]+)*)+\\.[a-z]{2,4}$",$From))
	{
		$ok = FALSE;
	}
	else
	{
		$ml = "Your email address is invalid !<br>";
		$ok = FALSE;
	}
// ------------------------------------------------------------------------- //

// ----------------------------- Upload Files ------------------------------ //
	$status    = '';
	$new_name  = '';
	$get_files = '';
	$all_names = '';
	
	for($i=0;$i<count($_FILES["fileup"]["tmp_name"]);$i++)
	{
		$name=$_FILES["fileup"]["name"][$i];
		$temp=$_FILES["fileup"]["tmp_name"][$i];
		$size=$_FILES["fileup"]["size"][$i];
		$type=$_FILES["fileup"]["type"][$i];
		$h = time();
		if($size > 0)
		{
			global $up_dir, $all_names;
			
			$new_name = $h .'-'. constant('timer') . '-' . $name;
			$new_name = strtr($new_name, " אהויטךכןמפצשüûס()[]'~$&%*@ח!?;,:/^?{}|+",  "_aaaeeeeiioouuun____________________E____"); 
			@move_uploaded_file($temp, $up_dir . $new_name);
			$all_names.= "$new_name\n";
		}
	}
// ------------------------------------------------------------------------- //

// ----------------------------- Upload Messages --------------------------- //
	if(empty($all_names))
	{
		$status   = "No files uploaded.";
	}
	else
	{
		$status    = "File(s) successfully uploaded.";
		$get_files = "\nGet the file(s): $up_full";
	}
//--------------------------------------------------------------------------- //

// ----------------------------- Mail Builder ------------------------------ //
	if($ok == "TRUE")
	{
		$referer = $_SERVER["HTTP_REFERER"];
 		$subject = "Feedback";
 		$body    = "Origin: $referer\n";
 		$body.="\n***** Results *****\n\n";

		if(count($_POST))
 		{
			while(list($key, $val) = each($_POST))
			{
				$body.="$key : $val\n";
    		}  
 		}

 		$body.="\n\n";
		$body.="Upload: $status\n";
		$body.="$all_names\n";
		$body.="$get_files\n";
 		$body.="*************************\n";
		
        $body = stripslashes($body);
  
 		if($online_isp == "1")
 		{
			if(!email("feedback",$dest,$sujet,$body))
			{
				print "An error occured during mail delivery <br>";
			}
 		}
 		else
		{
			$header  = '';
			$header.= 'From: "' . $Name . '" <' . $From . ">\r\n";
			$header.= 'Reply-To: "' . $Name . '" <' . $From . ">\r\n";
			$header.= "X-Mailer: PHP/" . phpversion();

			if(!mail($dest, $subject, $body, $header ))
			{
				print "An error occured during mail delivery <br>";
			}
		}
// ------------------------------------------------------------------------- //

// ---------------------------- Success Message ---------------------------- //
?>
<html><head><title>Success !</title></head><body bgcolor="white">
<center><table width="450" border="0" cellspacing="0" cellpadding="0"><tr>
<td width="100%" bgcolor="#000000">
<table width="550" border="0" cellspacing="1" cellpadding="2"><tr>
<td colspan="2" bgcolor="#ffffff"><div align="center"><br>
Thank you !<br><br>Your message has been successfully sent to the webmaster and should receive an answer shortly.<br><br>
<?php echo $status; ?>
<br><p>&nbsp;</p><p>&nbsp;</p>
<p><a href="<?php echo $home_url; ?>">Back to the main page</a></p><br></div>
<font size="-2"><a href="http://www.skyminds.net/scripts-php-mysql/" target="_blank">Mail-it Now!</a></font> 
</tr></table>
</td></tr></table></center></body>
<!--This script sources from SkyMinds.Net (http://www.skyminds.net/) -->
</html>
<?php
	}
// ------------------------------------------------------------------------- //
	else
	{
// ----------------------------- Error Message ----------------------------- //
?>
<html><head><title>Error !</title></head><body bgcolor="white">
<center><table width="450" border="0" cellspacing="0" cellpadding="0"><tr>
<td width="100%" bgcolor="#000000">
<table width="550" border="0" cellspacing="1" cellpadding="2"><tr>
<td colspan="2" bgcolor="#ffffff"><div align="center"><br><b>
<?php 
echo $noway;
echo $ml;
?>
</b><p><br><br>Your message could not be processed properly. Please note the error messages above and press the back button to try again.<br> If the problem still remains <a href="http://www.skyminds.net/contact/">contact the webmaster</a> to fix the problem.</p>
<p>&nbsp;</p><p>&nbsp;</p>
<p><a href='Javascript:history.go(-1)'>BACK</a></p><br></div>
<font size="-2"><a href="http://www.skyminds.net/scripts-php-mysql/" target="_blank">Mail-it Now!</a></font>
</tr></table>
</td></tr></table></center></body>
<!--This script sources from SkyMinds.Net (http://www.skyminds.net/) -->
</html>
<?php
// ------------------------------------------------------------------------- //
	} 
}
else
{
	$num = 0;
	$upload_box = '';
	while($num < $UploadNum)
	{
		$num++;
		$upload_box.= "<tr><td><font size='-1' face='verdana'>&nbsp;&nbsp;&nbsp;File $num:</font></td><td><input name='fileup[]' type='file'></td>";
	}
?>
<html>
<head>
<title>Contact form</title>
</head>
<body bgcolor="#FFFFFF" text="#000000" link="#003399" vlink="#003399" alink="#003399"
topmargin=" 0" leftmargin="0" marginwidth="0" marginheight="0" style="border: 1">
<!--
/*
Script Name: Mail-it Now! Upload2Server
Script URI: http://www.skyminds.net/scripts-php-mysql/
Description: Easy to use form2mail with multiple-uploads functionality.
Version: 1.5.3
Author: Matt Biscay
Author URI: http://www.skyminds.net/
Licence : Copyright 2001-2024 - SkyMinds.Net. All rights reserved. This script is linkware. Contact us for commercial use or custom version.
*/
-->
<table border="0" width="60%" align="center"><tr><td valign="top">
<table border="1" width="70%" bordercolor="#000000" bordercolordark="#FFFFFF" cols="1" align="center"><tr><td> 
<form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="post" enctype="multipart/form-data">
<table border="0" bordercolor="#000000" height="100" align="center"><tr> 
<td height="5" width="218"><font size="2" face="Arial, Helvetica, sans-serif"><b>Email : </b></font></td><td height="5" width="249"><input type="text" size="30" maxlength="255" name="From" style="background-color: #CCCCCC;font: verdana; color: #000000; border: 0px;" value=""></td></tr><tr><td height="5" width="218"><font size="2" face="Arial, Helvetica, sans-serif">Name : </font></td><td height="5" width="249"><input type="text" size="30" name="Name" style="background-color: #CCCCCC;font: verdana; color: #000000; border: 0px;" value=""></td></tr></table>
<p align="center"><b><font size="2" face="Arial, Helvetica, sans-serif">Message : </font></b><br><textarea name="Msg" cols="45" rows="7"></textarea><br></p>
<table width="95%" border="0" align="center"><tr align="center"><td>&nbsp;</td>
<?php echo $upload_box; ?></tr></table>
<p align="center"><br>
<input type="reset" name="reset" value=" Clear ">
<input type="submit" name="submit" value=" Send " style="background-color:#CCCCCC">
</p>
</form>
<font size="-2"><a href="http://www.skyminds.net/scripts-php-mysql/" target="_blank">Mail-it Now!</a></font>
</td></tr></table>
</td></tr></table>
</body>
<!--This script sources from SkyMinds.Net (http://www.skyminds.net/)  -->
</html>
<?php } ?>