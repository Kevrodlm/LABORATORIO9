<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication1.WebForm1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Formulario</title>
    <style>
        body {
            background-image: url(https://wallpaperset.com/w/full/8/4/6/175045.jpg);
            background-size: cover;
            background-color: #138D75;
            font-family: 'Old English Text MT';
            color: black;
        }

        h1 {
            text-shadow: -1px -1px 1px white, 1px 1px 1px white, -1px 1px 1px #000, 1px -1px 1px white;
            font-size: 51px;
            text-align: center;
            font-family: 'Old London';
            font-size: 80px; 
        }

        label, p, input[type="text"], input[type="email"] {
            font-family: 'Old English Text MT';
            font-size: 18px;
            color: black;
        }

        .redondeado {
            border-radius: 5px;
        }

        .confondo {
            background-color: green;
        }

        .sinborde {
            border: 0;
        }

        .sinbordefondo {
            background-color: #eee;
            border: 0;
        }

        .outlinenone {
            outline: none;
            background-color: #dfe;
            border: 0;
        }

        .redondeadonorelieve {
            border-radius: 5px;
            border: 1px solid #39c;
        }

        .button:hover {
            background-color: #4CAF50; /* Green */
            color: white;
        }

    </style>
    <script type="text/javascript">
        function limpiarCampos() {
            document.getElementById("nombre").value = "";
            document.getElementById("apellido").value = "";
            document.getElementById("radioButtonM").checked = false;
            document.getElementById("radioButtonF").checked = false;
            document.getElementById("correo").value = "";
            document.getElementById("direccion").value = "";
            document.getElementById("DropDownListCiudad").value = 0;
            document.getElementById("descripcion").value = "";
        }

        function validarFormulario() {
            var nombre = document.getElementById("nombre").value;
            var apellidos = document.getElementById("apellido").value;
            var generoM = document.getElementById("radioButtonM").checked;
            var generoF = document.getElementById("radioButtonF").checked;
            var correo = document.getElementById("correo").value;
            var ciudad = document.getElementById("DropDownListCiudad").value;

            // Verifica si el nombre no tienen letras
            var nombreP = /^[a-zA-Z\s]+$/;
            if (!nombre.match(nombreP)) {
                alert("Solo debe contener caracteres de la a-z, mayúsculas o minúsculas.");
                return false;
            }

            // Verifica si el apellido no tienen letras
            var apellidosP = /^[a-zA-Z\s]+$/;
            if (!apellidos.match(apellidosP)) {
                alert("Solo debe contener caracteres de la a-z, mayúsculas o minúsculas.");
                return false;
            }

            // Validar si selecciono un genero
            if (generoM === false && generoF === false) {
                alert("Debe seleccionar el género del alumno.");
                return false;
            }

            // Valida si el correo lleba @unsa.edu.pe
            var correoP = /^[a-zA-Z0-9._%+-]+@unsa\.edu\.pe$/;
            if (!correo.match(correoP)) {
                alert("El correo ingresado no es válido. Debe ser un correo institucional de la UNSA");
                return false;
            }

            // Validar si selecciono una ciudad
            if (ciudad === "0") {
                alert("Debe seleccionar una ciudad.");
                return false;
            }

            var fechaRegistro = new Date().toLocaleDateString();
            alert("Fecha de registro: " + fechaRegistro);

            return true;
        }
    </script>
</head>
<body>
    <form onsubmit="return validarFormulario()" id="form1" runat="server">
        <div class="container">
            <h1>REGISTRO DE ALUMNOS</h1>

            
            <div class="">
                <div class="">
                    <label for="nombre" class="" style="font-family: 'Old London'; font-size: 30px; ">Nombre</label>
                    <asp:TextBox ID="nombre" runat="server" CssClass="redondeado" required="true" style="font-family: 'Old London'; font-size: 30px; " Width="484px"></asp:TextBox>

                </div>
            </div>
            <br />
            <div class="">
                <div class="">
                    <label for="apellido" style="font-family: 'Old London'; font-size: 30px; " class="">Apellido</label>
                    <asp:TextBox ID="apellido" runat="server" CssClass="redondeado" style="font-family: 'Old London'; font-size: 30px; " required="true" Width="482px"></asp:TextBox>

                </div>
            </div>
            <br />
            <div class="">
                <div class="">
                    <label for="sexo" style="font-family: 'Old London'; font-size: 30px; " class="">Sexo</label>
                    <asp:RadioButton ID="radioButtonM" runat="server" type="radio" />

                    <label for="Masculino" style="font-family: 'Old London'; font-size: 30px; "  class="">Masculino</label>


                    <asp:RadioButton ID="radioButtonF" runat="server" type="radio" />
                    <label for="Masculino" style="font-family: 'Old London'; font-size: 30px; " class="">Femenino</label>
                </div>
            </div>

            <br />
            <div class="">
                <div class="">
                    <label for="correo" style="font-family: 'Old London'; font-size: 30px; " class="">Correo:</label>

                    <span class="" id="">@</span>
                    <asp:TextBox ID="correo" runat="server" type="email" CssClass="redondeado" style="font-family: 'Old London'; font-size: 30px; " required="true" aria-describedby="basic-addon1" Width="461px"></asp:TextBox>

                </div>
            </div>
            <br />
            <div class="">
                <div class="">
                    <label for="direccion" style="font-family: 'Old London'; font-size: 30px; " class="">Direccion:</label>
                    <asp:TextBox ID="direccion" CssClass="redondeado" style="font-family: 'Old London'; font-size: 30px; "  runat="server" required="true"></asp:TextBox>

                </div>
                <div class="">
                    <label for="ciudad" style="font-family: 'Old London'; font-size: 30px; " class="">Ciudad:</label>
                    <asp:DropDownList ID="DropDownListCiudad" runat="server" class="" aria-label=""></asp:DropDownList>

                </div>
            </div>
            <br />

            <div class="">
                <div class="">
                    <label for="requerimiento" style="font-family: 'Old London'; font-size: 30px; " >Requerimiento</label> :
                    <asp:TextBox ID="descripcion" runat="server" CssClass="redondeado" style="font-family: 'Old London'; font-size: 30px; " Width="535px"></asp:TextBox>
                </div>
            </div>
            <br />

            <div class="">
                <div class="">
                    <asp:Button ID="Button1" runat="server" Text="Limpiar" OnClientClick="return limpiarCampos()" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="ButtonEnviar" runat="server" Text="Enviar" OnClick="ButtonEnviar_Click" />

                </div>
            </div>
            <br /><br />
            <div class="">
                <div class="">
                    <asp:Label runat="server" ID="server" for="direccion" class="" Visible="false">Datos Registrados:</asp:Label>
                    <asp:TextBox ID="DatosRegistrados" runat="server" CssClass="redondeado" style="font-family: 'Old London'; font-size: 30px;"  TextMode="MultiLine" Visible="false" Height="65px" Width="519px"></asp:TextBox>
                </div>
                <div class="form-floating">
                </div>
            </div>
        </div>
    </form>
</body>
</html>