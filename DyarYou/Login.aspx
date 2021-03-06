﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8"/>
    <title>Login</title>
    <link rel="stylesheet" href="css/Login.css" type="text/css" media="all"/>
    <script src="js/Login.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <div style="padding:50px 0; float:left;">
	        <div class="logo">Login</div>
	            <div class="login-form-1">
		            <div id="login-form" class="text-left">
			            <div class="login-form-main-message"></div>
			            <div class="main-login-form">
				            <div class="login-group">
					            <div class="form-group">
						            <label for="lg_username" class="sr-only">Username</label>
						            <asp:Textbox runat="server" class="form-control" id="tb_username"/>
					            </div>
					            <div class="form-group">
						            <label for="lg_password" class="sr-only">Password</label>
						            <asp:Textbox runat="server" class="form-control" id="tb_password"/>
					            </div>
				            </div>
				            <asp:Button runat="server" class="login-button" OnClick="Login_Click" />
			            </div>
		            </div>
	            </div>
        </div>
        <div style="padding-left:400px; padding-top:50px;">
            <h1>Welcome to DyarU</h1>
                <p>
                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean ac tempus risus, eget aliquam velit. In molestie, diam eget viverra feugiat, erat nisl congue magna, vel convallis ipsum leo quis nibh. 
                    Duis ac lectus ac elit consequat ultricies. Sed a orci sed mi tristique malesuada at et justo. Vestibulum ultrices eros sit amet porta mattis. Phasellus sagittis consequat sapien, ac condimentum lorem porta id. 
                    Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae;

                    Duis efficitur elit ac feugiat euismod. Donec volutpat tristique lobortis. Aenean vestibulum pharetra nisi non sollicitudin. Etiam ultrices aliquet sem sit amet tincidunt. Cras ornare dignissim ornare. 
                    Nullam tristique metus at nulla convallis, non blandit leo cursus. Proin facilisis at nibh in venenatis. Pellentesque vitae sapien et urna dignissim blandit.

                    Curabitur nec efficitur tellus. Nulla sem velit, vulputate vitae venenatis id, convallis et nunc. Maecenas vel est nunc. Quisque eros lectus, condimentum vel massa vel, dignissim viverra dui. 
                    Nunc lorem turpis, vestibulum vel ligula in, ultricies pretium tellus. Nam non aliquam enim. Sed in pretium mauris. Mauris luctus purus ac tellus fringilla, sed congue arcu rutrum. Nunc sit amet porttitor dolor, et euismod justo. 
                    Suspendisse dictum ante vel ornare efficitur. Proin dapibus pellentesque orci, id egestas risus ultricies quis. In laoreet felis in orci egestas, et egestas lacus consequat. Pellentesque sed gravida tortor. Vestibulum scelerisque cursus ornare. 
                    Fusce ac erat at turpis faucibus vestibulum.
                </p>
        </div>
        </div>
    </form>
</body>
</html>
