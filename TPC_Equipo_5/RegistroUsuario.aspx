<%@ Page Title="" Language="C#" MasterPageFile="~/site.Master" AutoEventWireup="true" CodeBehind="RegistroUsuario.aspx.cs" Inherits="TPC_Equipo_5.RegistroUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container d-flex justify-content-center align-items-center vh-100">
        <div class="card shadow p-3 mb-5 mt-5 bg-body-tertiary rounded  bg-white p-5 rounded-5 text-secondary" style="width: 40rem; border-color: #c32a2a; height: 40rem;">
            <div class="d-flex justify-content-center">
                <img style="height: 50px" src="https://i.imgur.com/9ffo48f.png" alt="OverCloaked">
                <%--hay que cambiar imagen --%>
            </div>
            <div class="text-center fs-1 fw-bold">Crear cuenta</div>
            <div class="container" >
                <div>
                    <div class="input-group mt-4">

                        <div class="input-group-text " style="background-color: #c32a2a; color: whitesmoke">
                            <label>Nombre</label>
                        </div>
                        <input class="form-control" type="text" />
                    </div>
                    <div class="input-group mt-1">
                        <div class="input-group-text" style="background-color: #c32a2a; color: whitesmoke">
                            <label>Apellido</label>
                        </div>
                        <input class="form-control" type="password" />
                    </div>
                </div>
                <div class=" mt-1 input-group">

                    <div class="input-group-text" style="background-color: #c32a2a; width: 5.3rem; color: white">
                        <label>Genero</label>
                    </div>
                    <div class="d-flex align-items-center gap-4 ms-2 ">

                        <div class="pt-1" style="font-size: 0.9rem">
                            <label>Mujer</label>
                            <input class="form-check-input" type="checkbox" />
                        </div>

                        <div class="pt-1" style="font-size: 0.9rem">
                            <label>Hombre</label>
                            <input class="form-check-input" type="checkbox" />
                        </div>

                        <div class="pt-1" style="font-size: 0.9rem">
                            <label>Prefiero no decirlo</label>
                            <input class="form-check-input" type="checkbox" />
                        </div>
                    </div>


                </div>
                <div class="input-group mt-1">
                    <div class="input-group-text" style="background-color: #c32a2a; color: whitesmoke; width: 5.3rem">
                        <label>Email</label>
                    </div>
                    <input class="form-control " type="text" placeholder="Example@gmail.com" />
                </div>
                <div class="input-group mt-4">

                    <div class="input-group-text " style="background-color: #c32a2a; color: whitesmoke; width: 6.5rem">
                        <label>Usuario</label>
                    </div>
                    <input class="form-control" type="text" />
                </div>
                <div class="input-group mt-1">

                    <div class="input-group-text " style="background-color: #c32a2a; color: whitesmoke">
                        <label>Contraseña</label>
                    </div>
                    <input class="form-control" type="password" />
                </div>
                <div class="d-flex gap-1 justify-content-center mt-4">
                    <div>ya tenes cuenta?</div>
                    <a href="Usuario.aspx" class="text-decoration-none  fw-semibold" style="color: #c32a2a">Ingresa aca</a>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
