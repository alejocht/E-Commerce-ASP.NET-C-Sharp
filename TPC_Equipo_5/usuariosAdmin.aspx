<%@ Page Title="" Language="C#" MasterPageFile="~/siteAdmin.Master" AutoEventWireup="true" CodeBehind="usuariosAdmin.aspx.cs" Inherits="TPC_Equipo_5.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="css/stylePaginaWeb.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" id="containerPrincipal" style="color: white; min-height: 600px">
        <asp:GridView ID="dgv_usuarios" DataKeyNames="id" CssClass="table table-dark table-bordered" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" runat="server" OnPageIndexChanging="dgv_usuarios_PageIndexChanging">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="id" />
                <asp:BoundField HeaderText="Usuario" DataField="usuario" />
                <asp:TemplateField HeaderText="Nombre">
                    <ItemTemplate>
                        <%# Eval("dato.nombre") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Apellido">
                    <ItemTemplate>
                        <%# Eval("dato.apellido") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:CheckBoxField HeaderText="Admin" DataField="admin" />
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
