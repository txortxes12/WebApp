<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication6.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="Styles/estyle.css" rel="stylesheet" type="text/css"/>
   
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class ="row">

            <h2>
                <asp:Label ID="lblTitulo" runat="server" Text="Paginacion" CssClass="Milabel" ></asp:Label></h2>

            <div class="row placeholders">
                <div class="navbar-form navbar-left" role="search">
                    <div class="form-group">
                        <asp:TextBox ID="txtDesc" type="text" class="form-control" placeholder="Descripcion" runat="server" />
                    </div>
                    <asp:Button ID="btnBuscar" CssClass="btn btn-default" runat="server" Text="Buscar" OnClick="btnBuscar_Click" />
                </div>
                
                </div>
                </div>
           <div class ="row">
                <div class="table-responsive">
                    <asp:GridView ID="gdvLista" CssClass="table table-bordered" runat="server"
                        AutoGenerateColumns="False"
                        PageSize="5"
                        AllowPaging="True"
                        AllowCustomPaging="True"
                        OnPageIndexChanging="gdvLista_PageIndexChanging"
                        OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
                        OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No se han encontrado resultados para tu busqueda">
                        <Columns>
                            <asp:TemplateField HeaderText="CÓDIGO" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="lblCodigo" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    </TemplateField>
                                    <asp:TextBox ReadOnly ="true" ID="txtCodigo" runat="server" Text='<%# Eval("ProductID") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="DESCRIPCIÓN" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="lblDescripcion" runat="server" Text='<%# Eval("ProductName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtDescripcion" runat="server" Text='<%# Eval("ProductName") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PRECIO" ItemStyle-Width="150">
                                <ItemTemplate>
                                    <asp:Label ID="lblPrecio" runat="server" Text='<%# Eval("UnitPrice") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtPrecio" runat="server" Text='<%# Eval("UnitPrice") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                             <asp:TemplateField HeaderText="STOCK" ItemStyle-Width="120">
                                <ItemTemplate>
                                    <asp:Label ID="lblbUnitsStock" runat="server" Text='<%# Eval("UnitsInStock") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtUnitsStock" runat="server" Text='<%# Eval("UnitsInStock") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="150" />
                        </Columns>
                                    <PagerSettings Mode="NumericFirstLast"
                           PageButtonCount="8" 
                           FirstPageText="Primero"
                           LastPageText="Ultimo"
                />
            <PagerStyle CssClass="pagination-ys" HorizontalAlign="Center" />
        </asp:GridView>


                    
                    <table class="tabla1" border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse" >
                        <tr>
                            <td>
                            <asp:TextBox ID="txtCodAg"  class="form-control" placeholder="Codigo generado automaticamente " ReadOnly="true" runat="server" />
                            </td>
                            <td >
                                <asp:TextBox ID="txtDesAg" runat="server" placeholder="Descripcion "  />
                            </td>
                            <td >
                                <asp:TextBox ID="TextPreAg" runat="server" placeholder="Precio " />
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
                                    ControlToValidate="TextStockAg" runat="server"
                                    ValidationExpression="\d+">
                                </asp:RegularExpressionValidator>
                            </td>
                            <td >
                                <asp:TextBox ID="TextStockAg" runat="server" placeholder="Stock" />
                                   <asp:RegularExpressionValidator ID="RegularExpressionValidator2"
                                    ControlToValidate="TextStockAg" runat="server"
                                    ValidationExpression="\d+">
                                </asp:RegularExpressionValidator>
                            </td>
                            <td>
                                <asp:Button ID="btnAdd" runat="server" Text="Add" class="btn btn-success"/>
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </form>
    <script src="Scripts/jquery-3.3.1.min.js"> </script>
    <script src="Scripts/popper.min.js"> </script>
    <script src="Scripts/bootstrap.min.js "> </script>
</body>

</html>
