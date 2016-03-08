<HTML>
   <BODY>
   <link href="style1.css" rel="stylesheet" type="text/css">
   <?php
    if(!isset($_POST['button'])){
   ?><CENTER>
     <DIV ID="body">
     <FORM METHOD=POST ACTION="function/prima.php">
      <TABLE width="200" align="center">
	  <TR>
	  <TD COLSPAN="3">
	  Masukkan Jumlah:
	  </TD>
	  </TR>
      <TR>
		<TD><INPUT TYPE="text" NAME="num" SIZE="10"></TD>
	
      </TR>
      </TABLE>
	  <TABLE width="200" align="center">
	  <TR>
	  
	  
	  <TR>
        <TD COLSPAN="3"><INPUT TYPE="submit"name="button" value="Draw"></TD>
	  </TR>
	  </TABLE>
	  
	  </FORM>
	  </DIV></CENTER>
	  <?php
		}
      ?>
   </BODY>
</HTML>
