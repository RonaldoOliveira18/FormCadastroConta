<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="CriarConta.WebForm1" %>
<!DOCTYPE html>
<html>
    <head>
        <title>bootstrap datepicker examples</title>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Bootstrap CSS and bootstrap datepicker CSS used for styling the demo pages-->

<link href="Content/datepicker.css" rel="stylesheet" />
<link href="Content/bootstrap.css" rel="stylesheet" />
    </head>
    <body>
        <div class="container">
            <div class="hero-unit">
                <input  type="text" placeholder="click to show datepicker"  id="example1">
            </div>
        </div>
        <!-- Load jQuery and bootstrap datepicker scripts -->

<script src="Scripts/jquery-3.1.1.min.js"></script>
<script src="Scripts/bootstrap-datepicker.js"></script>

        <script type="text/javascript">
            // When the document is ready
            $(document).ready(function () {

                $('#example1').datepicker({
                    format: "dd/mm/yyyy"
                });

            });
        </script>
    </body>
</html>