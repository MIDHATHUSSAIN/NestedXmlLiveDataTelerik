<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default" %>
<%@ Register TagPrefix="telerik" Namespace="Telerik.Web.UI" Assembly="Telerik.Web.UI" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <telerik:RadStyleSheetManager id="RadStyleSheetManager1" runat="server" />
    <link href="./Style/Style.css" rel="Stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager runat="server"></asp:ScriptManager>
        <div style="padding:2rem; background-color:rgb(242, 242, 242)">
				 <div class="headerDiv" >
					 <asp:Literal runat="server"  ID="mi" ></asp:Literal>
						<div >
							<div class="text"><asp:Literal runat="server" ID="ExpectedEnergy">Expected Energy</asp:Literal></div><br />
							<div class="values"><asp:Literal runat="server" ID="Literal1">176.47<span class="text">MWh</span></asp:Literal></div>
						</div>
						<div>
							<div class="text"><asp:Literal runat="server" ID="ProducedEnergy">Produced Energy</asp:Literal></div><br />
							<div class="values"><asp:Literal runat="server" ID="Literal4">120.95<span class="text">MWh</span></asp:Literal></div>
						</div>
						<div>
							<div class="text"><asp:Literal runat="server" ID="DeliverdEnergy">Deliverd Energy</asp:Literal></div><br />
							<div class="values"><asp:Literal runat="server" ID="Literal2">120.68<span class="text">MWh</span></asp:Literal></div>
						</div>
            
						<div>
							<div class="text"><asp:Literal runat="server" ID="AvgWindSpd">Avg Wind Spd</asp:Literal></div><br />
							<div class="values"><asp:Literal runat="server" ID="Literal3">5.65<span class="text">m/s</span></asp:Literal></div>
						</div>
						<div>
							<div class="text"><asp:Literal runat="server" ID="BillableEnergy">Billable Energy This Month</asp:Literal></div><br />
							<div class="values"><asp:Literal runat="server" ID="Literal6">2.3<span class="text">GWh</span></asp:Literal></div>
						</div>
				 </div>
				<div style="background-color:white ; margin-top:1rem; height:30rem; display:flex; justify-content:center ; align-items:center; flex-wrap:wrap">
					<div>
						<asp:UpdatePanel runat="server" ID="UpdatePanle1" UpdateMode="Conditional">
						<ContentTemplate>
						<div class="middle">
							<div class="turbine" runat="server" ID="one" title=""><div style="margin-top:1.3rem; margin-left:1.6rem">1</div></div>
							<div class="turbine" runat="server" ID="two" title=""><div style="margin-top:1.3rem; margin-left:1.6rem">2</div></div>
							<div class="turbine" runat="server" ID="three" title=""><div style="margin-top:1.3rem; margin-left:1.6rem">3</div></div>
						</div></ContentTemplate>
							<Triggers>
								 <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
							</Triggers>
						</asp:UpdatePanel><br /><br />
							<asp:Timer runat="server" ID="Timer1" Interval="5000" OnTick="Timer1_Tick" />
						<div style="display:flex; gap:2rem; justify-content:center; align-items:center; flex-wrap: wrap; max-width:60rem">
							<div class="status"><div class="turbineStatus" style=" background-color:lawngreen;"></div><span>Running</span></div>
							<div class="status"><div class="turbineStatus" style=" background-color:darkseagreen;"></div><span>Ready</span></div>
							<div class="status"><div class="turbineStatus" style=" background-color:red;"></div><span>Emergency</span></div>
							<div class="status"><div class="turbineStatus" style=" background-color:lightcoral;"></div><span>Stop</span></div>
							<div class="status"><div class="turbineStatus" style=" background-color:forestgreen;"></div><span>Limited and Degarded</span></div>
							<div class="status"><div class="turbineStatus" style=" background-color:lightyellow;"></div><span>Paused</span></div>
							<div class="status"><div class="turbineStatus" style=" background-color:black;"></div><span>Manual</span></div>
							<div class="status"><div class="turbineStatus" style=" background-color:mediumpurple;"></div><span>Paused by Tool</span></div>
							<div class="status"><div class="turbineStatus" style=" background-color:aqua;"></div><span>Not Communicate</span></div>
						</div>
					</div>

				</div>
				<div class="midhat">
				
							<div >
								<telerik:RadHtmlChart runat="server" ID="LineChart" Width="900" Height="510" Transitions="true">
									<PlotArea>
									  <Series>
										 <telerik:LineSeries Name="Week 15" MissingValues="Interpolate">
											 <Appearance>
												<FillStyle BackgroundColor="Blue" />
											 </Appearance>
											<LabelsAppearance DataFormatString="{0}%" Position="Above" />
												<MarkersAppearance MarkersType="Square" BackgroundColor="Blue" />
												<SeriesItems>
													<telerik:CategorySeriesItem Y="15" />
													<telerik:CategorySeriesItem Y="23" />
													<telerik:CategorySeriesItem />
													<telerik:CategorySeriesItem Y="71" />
													<telerik:CategorySeriesItem Y="93" />
													<telerik:CategorySeriesItem Y="43" />
													<telerik:CategorySeriesItem Y="23" />
												</SeriesItems>
										</telerik:LineSeries>
										<telerik:LineSeries Name="Week 16" MissingValues="Gap">
											<Appearance>
												<FillStyle BackgroundColor="Red" />
											</Appearance>
											<LabelsAppearance DataFormatString="{0}%" Position="Above" />
											<MarkersAppearance MarkersType="Square" BackgroundColor="Red" />
											<SeriesItems>
												<telerik:CategorySeriesItem Y="35" />
												<telerik:CategorySeriesItem Y="42" />
												<telerik:CategorySeriesItem Y="18" />
												<telerik:CategorySeriesItem Y="39" />
												<telerik:CategorySeriesItem Y="64" />
												<telerik:CategorySeriesItem Y="10" />
												<telerik:CategorySeriesItem Y="6" />
											</SeriesItems>
										</telerik:LineSeries>
									</Series>
										<XAxis MajorTickType="Outside" MinorTickType="Outside">
											<Items>
												<telerik:AxisItem LabelText="Monday" />
												<telerik:AxisItem LabelText="Tuesday" />
												<telerik:AxisItem LabelText="Wednesday" />
												<telerik:AxisItem LabelText="Thursday" />
												<telerik:AxisItem LabelText="Friday" />
												<telerik:AxisItem LabelText="Saturday" />
												<telerik:AxisItem LabelText="Sunday" />
											</Items>
											<MajorGridLines Color="#EFEFEF" Width="1" />
											<MinorGridLines Color="#F7F7F7" Width="1" />
											<TitleAppearance Position="Center" RotationAngle="0" Text="Days" />
										</XAxis>
										<YAxis MajorTickSize="1" MajorTickType="Outside" MaxValue="100" MinorTickSize="1"
											MinorTickType="Outside" MinValue="0">
											<LabelsAppearance DataFormatString="{0}%" RotationAngle="0" />
											<MajorGridLines Color="#EFEFEF" Width="1" />
											<MinorGridLines Color="#F7F7F7" Width="1" />
											<TitleAppearance Position="Center" RotationAngle="0" Text="CPU Load" />
										</YAxis>
									</PlotArea>
									<ChartTitle Text="Server CPU Load By Days">
									</ChartTitle>
									<Legend>
										<Appearance Position="Bottom" />
									</Legend>
									</telerik:RadHtmlChart>
							</div>
							<div class="graygap"></div>
							
							<div style="background-color:white; margin-left:1rem;  height:32rem ; display:flex; flex-direction:column; align-items:center">
								<asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
							<ContentTemplate>
								<telerik:RadRadialGauge runat="server" ID="RadRadialGauge1" Height="200px" Width="200px">
                      
									<Pointer Value="0" Color="Black">
										<Cap Color="Gray" Size="0.1" />
									</Pointer>
									<Scale Min="0" Max="300" MajorUnit="30" MinorUnit="5">
									<Labels Format="" Position="Inside"/>
										<Ranges>
											<telerik:GaugeRange Color="Orange" From="150" To="190" />
											<telerik:GaugeRange Color="Green" From="190" To="230" />
											<telerik:GaugeRange Color="Red" From="230" To="300" />
										</Ranges>
									</Scale>
								</telerik:RadRadialGauge>
								<telerik:RadRadialGauge runat="server" ID="RadRadialGauge2" Height="200px" Width="200px">
                      
									<Pointer Value="0" Color="Black">
										<Cap Color="Gray" Size="0.1" />
									</Pointer>
									<Scale Min="0" Max="300" MajorUnit="30" MinorUnit="5">
									<Labels Format="" Position="Inside"/>
										<Ranges>
											<telerik:GaugeRange Color="Orange" From="150" To="190" />
											<telerik:GaugeRange Color="Green" From="190" To="230" />
											<telerik:GaugeRange Color="Red" From="230" To="300" />
										</Ranges>
									</Scale>
								</telerik:RadRadialGauge>
							</div>
						</ContentTemplate>
							<Triggers>
								 <asp:AsyncPostBackTrigger ControlID="Timer1" EventName="Tick" />
							</Triggers>
						</asp:UpdatePanel>
					</div>
         </div>

    </form>
</body>
</html>
