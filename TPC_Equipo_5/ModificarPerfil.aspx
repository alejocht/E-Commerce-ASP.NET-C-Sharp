<%@ Page Title="" Language="C#" MasterPageFile="~/siteAdmin.Master" AutoEventWireup="true" CodeBehind="ModificarPerfil.aspx.cs" Inherits="TPC_Equipo_5.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePaginaWeb.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        label {
            color: white;
        }
    </style>
    <div class="container m-4" style="min-height: 600px">

        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="form-group row p-1">
                    <label for="TxtMail" class="col-sm-3 col-form-label">Correo</label>
                    <div class="col-sm-9">
                        <asp:TextBox ID="TxtMail" Type="mail" CssClass="form-control" runat="server"></asp:TextBox>

                    </div>
                </div>
                <div class="form-group row p-1">
                    <label for="TxtNombre" class="col-sm-3 col-form-label">Nombre</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="TxtNombre" runat="server" type="text" class="form-control"></asp:TextBox>
                    </div>
                    <label for="TxtApellido" class="col-sm-2 col-form-label">Apellido</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="TxtApellido" type="text" class="form-control" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group row p-1">
                    <label for="txtContrasenia" class="col-sm-3 col-form-label">Contraseña</label>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtContrasenia" Type="password" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>
                    <label for="txtRepetirContrasenia" class="col-sm-2 col-form-label">Confirmar</label>
                    <div class="col-sm-3">
                        <asp:TextBox ID="TxtRepetirContrasenia" Type="password" CssClass="form-control" runat="server"></asp:TextBox>
                    </div>


                    <div class="form-group row p-1">
                        <label for="ChkAdmin" class="col-sm-3 col-form-label">Administrador</label>
                        <div class="col-sm-4">
                            <asp:CheckBox ID="ChkAdmin" runat="server" />
                        </div>
                    </div>

                </div>
                <div class="form-group row p-1">

                    <div class="col-sm-4">
                        <asp:Button ID="BtnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary" OnClick="BtnCancelar_Click" />
                    </div>
                    <div class="col-sm-3">
                        <asp:Button ID="BtnModificar" runat="server" Text="Modificar" CssClass="btn btn-success" OnClick="BtnModificar_Click" />
                    </div>

                </div>



            </div>
        </div>
</asp:Content>
