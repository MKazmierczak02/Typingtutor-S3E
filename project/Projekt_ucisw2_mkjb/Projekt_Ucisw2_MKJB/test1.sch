<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan3e" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2(7:0)" />
        <signal name="VGA_HS" />
        <signal name="VGA_VS" />
        <signal name="VGA_B" />
        <signal name="SW_0" />
        <signal name="SW_1" />
        <signal name="SW_2" />
        <signal name="Clk_50MHz" />
        <signal name="btn_south" />
        <signal name="VGA_G" />
        <signal name="XLXN_21" />
        <signal name="XLXN_23" />
        <signal name="VGA_R" />
        <signal name="PS2_Clk" />
        <signal name="PS2_Data" />
        <signal name="XLXN_47" />
        <signal name="XLXN_50" />
        <signal name="XLXN_51(7:0)" />
        <signal name="XLXN_52" />
        <signal name="LED_0" />
        <signal name="XLXN_54" />
        <signal name="XLXN_56" />
        <signal name="XLXN_57" />
        <signal name="XLXN_59" />
        <signal name="LED_1" />
        <port polarity="Output" name="VGA_HS" />
        <port polarity="Output" name="VGA_VS" />
        <port polarity="Output" name="VGA_B" />
        <port polarity="Input" name="SW_0" />
        <port polarity="Input" name="SW_1" />
        <port polarity="Input" name="SW_2" />
        <port polarity="Input" name="Clk_50MHz" />
        <port polarity="Input" name="btn_south" />
        <port polarity="Output" name="VGA_G" />
        <port polarity="Output" name="VGA_R" />
        <port polarity="Input" name="PS2_Clk" />
        <port polarity="Input" name="PS2_Data" />
        <port polarity="Output" name="LED_0" />
        <port polarity="Output" name="LED_1" />
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="VGAtxt48x20">
            <timestamp>2008-9-4T9:59:2</timestamp>
            <rect width="304" x="64" y="-640" height="728" />
            <rect width="64" x="0" y="-620" height="24" />
            <line x2="0" y1="-608" y2="-608" x1="64" />
            <line x2="0" y1="-448" y2="-448" x1="64" />
            <line x2="0" y1="-384" y2="-384" x1="64" />
            <line x2="0" y1="-320" y2="-320" x1="64" />
            <line x2="0" y1="64" y2="64" x1="64" />
            <line x2="0" y1="0" y2="0" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="432" y1="-352" y2="-352" x1="368" />
            <line x2="432" y1="-608" y2="-608" x1="368" />
            <line x2="432" y1="-544" y2="-544" x1="368" />
            <line x2="432" y1="-480" y2="-480" x1="368" />
            <line x2="0" y1="-544" y2="-544" x1="64" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <blockdef name="PS2_Kbd">
            <timestamp>2008-9-19T9:9:36</timestamp>
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
        </blockdef>
        <blockdef name="String_printer_2">
            <timestamp>2024-4-4T8:48:2</timestamp>
            <line x2="384" y1="224" y2="224" x1="320" />
            <line x2="0" y1="160" y2="160" x1="64" />
            <line x2="0" y1="32" y2="32" x1="64" />
            <rect width="64" x="0" y="84" height="24" />
            <line x2="0" y1="96" y2="96" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="256" x="64" y="-192" height="448" />
        </blockdef>
        <blockdef name="and3b2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="40" y1="-64" y2="-64" x1="0" />
            <circle r="12" cx="52" cy="-64" />
            <line x2="40" y1="-128" y2="-128" x1="0" />
            <circle r="12" cx="52" cy="-128" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="192" y1="-128" y2="-128" x1="256" />
            <line x2="64" y1="-64" y2="-192" x1="64" />
            <arc ex="144" ey="-176" sx="144" sy="-80" r="48" cx="144" cy="-128" />
            <line x2="64" y1="-80" y2="-80" x1="144" />
            <line x2="144" y1="-176" y2="-176" x1="64" />
        </blockdef>
        <block symbolname="gnd" name="XLXI_7">
            <blockpin signalname="XLXN_23" name="G" />
        </block>
        <block symbolname="VGAtxt48x20" name="XLXI_9">
            <blockpin signalname="XLXN_2(7:0)" name="Char_DI(7:0)" />
            <blockpin signalname="XLXN_23" name="Home" />
            <blockpin signalname="XLXN_23" name="NewLine" />
            <blockpin signalname="XLXN_23" name="Goto00" />
            <blockpin signalname="Clk_50MHz" name="Clk_Sys" />
            <blockpin signalname="Clk_50MHz" name="Clk_50MHz" />
            <blockpin signalname="SW_0" name="CursorOn" />
            <blockpin signalname="SW_1" name="ScrollEn" />
            <blockpin signalname="SW_2" name="ScrollClear" />
            <blockpin signalname="XLXN_52" name="Busy" />
            <blockpin signalname="VGA_HS" name="VGA_HS" />
            <blockpin signalname="VGA_VS" name="VGA_VS" />
            <blockpin signalname="XLXN_21" name="VGA_RGB" />
            <blockpin signalname="XLXN_59" name="Char_WE" />
        </block>
        <block symbolname="buf" name="XLXI_14">
            <blockpin signalname="XLXN_21" name="I" />
            <blockpin signalname="VGA_G" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_15">
            <blockpin signalname="XLXN_21" name="I" />
            <blockpin signalname="VGA_B" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_16">
            <blockpin signalname="XLXN_21" name="I" />
            <blockpin signalname="VGA_R" name="O" />
        </block>
        <block symbolname="PS2_Kbd" name="XLXI_17">
            <blockpin signalname="PS2_Clk" name="PS2_Clk" />
            <blockpin signalname="PS2_Data" name="PS2_Data" />
            <blockpin signalname="Clk_50MHz" name="Clk_50MHz" />
            <blockpin signalname="XLXN_47" name="E0" />
            <blockpin signalname="LED_0" name="F0" />
            <blockpin signalname="XLXN_54" name="DO_Rdy" />
            <blockpin signalname="XLXN_51(7:0)" name="DO(7:0)" />
            <blockpin signalname="Clk_50MHz" name="Clk_Sys" />
        </block>
        <block symbolname="String_printer_2" name="XLXI_21">
            <blockpin signalname="Clk_50MHz" name="Clk" />
            <blockpin signalname="btn_south" name="Reset" />
            <blockpin signalname="XLXN_52" name="TxBusy" />
            <blockpin signalname="XLXN_57" name="DIRdy" />
            <blockpin signalname="LED_0" name="F0" />
            <blockpin signalname="XLXN_51(7:0)" name="DI(7:0)" />
            <blockpin signalname="XLXN_59" name="DORdy" />
            <blockpin signalname="LED_1" name="Finished" />
            <blockpin name="Busy" />
            <blockpin signalname="XLXN_2(7:0)" name="DO(7:0)" />
        </block>
        <block symbolname="and3b2" name="XLXI_22">
            <blockpin signalname="XLXN_47" name="I0" />
            <blockpin signalname="LED_0" name="I1" />
            <blockpin signalname="XLXN_54" name="I2" />
            <blockpin signalname="XLXN_57" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="XLXN_2(7:0)">
            <wire x2="1936" y1="720" y2="720" x1="1792" />
            <wire x2="2192" y1="528" y2="528" x1="1936" />
            <wire x2="1936" y1="528" y2="720" x1="1936" />
        </branch>
        <branch name="VGA_HS">
            <wire x2="2656" y1="528" y2="528" x1="2624" />
        </branch>
        <iomarker fontsize="28" x="2656" y="528" name="VGA_HS" orien="R0" />
        <branch name="VGA_VS">
            <wire x2="2656" y1="592" y2="592" x1="2624" />
        </branch>
        <iomarker fontsize="28" x="2656" y="592" name="VGA_VS" orien="R0" />
        <branch name="VGA_B">
            <wire x2="3040" y1="784" y2="784" x1="2960" />
        </branch>
        <instance x="1984" y="624" name="XLXI_7" orien="R90" />
        <branch name="SW_0">
            <wire x2="2192" y1="912" y2="912" x1="2160" />
        </branch>
        <iomarker fontsize="28" x="2160" y="912" name="SW_0" orien="R180" />
        <branch name="SW_1">
            <wire x2="2192" y1="976" y2="976" x1="2160" />
        </branch>
        <iomarker fontsize="28" x="2160" y="976" name="SW_1" orien="R180" />
        <branch name="SW_2">
            <wire x2="2192" y1="1040" y2="1040" x1="2160" />
        </branch>
        <iomarker fontsize="28" x="2160" y="1040" name="SW_2" orien="R180" />
        <branch name="Clk_50MHz">
            <wire x2="400" y1="1200" y2="1200" x1="336" />
            <wire x2="832" y1="1200" y2="1200" x1="400" />
            <wire x2="2112" y1="1200" y2="1200" x1="832" />
            <wire x2="2192" y1="1200" y2="1200" x1="2112" />
            <wire x2="416" y1="1008" y2="1008" x1="400" />
            <wire x2="400" y1="1008" y2="1072" x1="400" />
            <wire x2="400" y1="1072" y2="1200" x1="400" />
            <wire x2="416" y1="1072" y2="1072" x1="400" />
            <wire x2="1408" y1="592" y2="592" x1="832" />
            <wire x2="832" y1="592" y2="1200" x1="832" />
            <wire x2="2192" y1="1136" y2="1136" x1="2112" />
            <wire x2="2112" y1="1136" y2="1200" x1="2112" />
        </branch>
        <branch name="btn_south">
            <wire x2="1408" y1="656" y2="656" x1="320" />
        </branch>
        <instance x="2192" y="1136" name="XLXI_9" orien="R0">
        </instance>
        <branch name="VGA_G">
            <wire x2="3040" y1="720" y2="720" x1="2960" />
        </branch>
        <instance x="2736" y="816" name="XLXI_15" orien="R0" />
        <branch name="XLXN_21">
            <wire x2="2720" y1="656" y2="656" x1="2624" />
            <wire x2="2720" y1="656" y2="720" x1="2720" />
            <wire x2="2720" y1="720" y2="784" x1="2720" />
            <wire x2="2736" y1="784" y2="784" x1="2720" />
            <wire x2="2736" y1="720" y2="720" x1="2720" />
            <wire x2="2736" y1="656" y2="656" x1="2720" />
        </branch>
        <iomarker fontsize="28" x="3040" y="784" name="VGA_B" orien="R0" />
        <iomarker fontsize="28" x="3040" y="720" name="VGA_G" orien="R0" />
        <instance x="2736" y="752" name="XLXI_14" orien="R0" />
        <branch name="XLXN_23">
            <wire x2="2144" y1="688" y2="688" x1="2112" />
            <wire x2="2192" y1="688" y2="688" x1="2144" />
            <wire x2="2144" y1="688" y2="752" x1="2144" />
            <wire x2="2192" y1="752" y2="752" x1="2144" />
            <wire x2="2144" y1="752" y2="816" x1="2144" />
            <wire x2="2192" y1="816" y2="816" x1="2144" />
        </branch>
        <instance x="2736" y="688" name="XLXI_16" orien="R0" />
        <branch name="VGA_R">
            <wire x2="3040" y1="656" y2="656" x1="2960" />
        </branch>
        <iomarker fontsize="28" x="3040" y="656" name="VGA_R" orien="R0" />
        <branch name="PS2_Clk">
            <wire x2="416" y1="880" y2="880" x1="304" />
        </branch>
        <branch name="PS2_Data">
            <wire x2="416" y1="944" y2="944" x1="320" />
        </branch>
        <iomarker fontsize="28" x="336" y="1200" name="Clk_50MHz" orien="R180" />
        <instance x="416" y="1104" name="XLXI_17" orien="R0">
        </instance>
        <iomarker fontsize="28" x="320" y="944" name="PS2_Data" orien="R180" />
        <branch name="XLXN_47">
            <wire x2="864" y1="944" y2="944" x1="800" />
        </branch>
        <branch name="XLXN_51(7:0)">
            <wire x2="1104" y1="880" y2="880" x1="800" />
            <wire x2="1104" y1="848" y2="880" x1="1104" />
            <wire x2="1408" y1="848" y2="848" x1="1104" />
        </branch>
        <branch name="XLXN_52">
            <wire x2="1408" y1="720" y2="720" x1="1360" />
            <wire x2="1360" y1="720" y2="1280" x1="1360" />
            <wire x2="2688" y1="1280" y2="1280" x1="1360" />
            <wire x2="2688" y1="784" y2="784" x1="2624" />
            <wire x2="2688" y1="784" y2="1280" x1="2688" />
        </branch>
        <iomarker fontsize="28" x="320" y="656" name="btn_south" orien="R180" />
        <iomarker fontsize="28" x="304" y="880" name="PS2_Clk" orien="R180" />
        <branch name="LED_0">
            <wire x2="848" y1="1008" y2="1008" x1="800" />
            <wire x2="864" y1="1008" y2="1008" x1="848" />
            <wire x2="848" y1="1008" y2="1120" x1="848" />
            <wire x2="1408" y1="1120" y2="1120" x1="848" />
            <wire x2="1616" y1="1120" y2="1120" x1="1408" />
            <wire x2="1616" y1="1120" y2="1376" x1="1616" />
            <wire x2="1408" y1="912" y2="1120" x1="1408" />
        </branch>
        <instance x="1408" y="752" name="XLXI_21" orien="R0">
        </instance>
        <branch name="XLXN_54">
            <wire x2="864" y1="1072" y2="1072" x1="800" />
        </branch>
        <instance x="864" y="880" name="XLXI_22" orien="M180" />
        <iomarker fontsize="28" x="1616" y="1376" name="LED_0" orien="R90" />
        <branch name="XLXN_57">
            <wire x2="1264" y1="1008" y2="1008" x1="1120" />
            <wire x2="1264" y1="784" y2="1008" x1="1264" />
            <wire x2="1408" y1="784" y2="784" x1="1264" />
        </branch>
        <iomarker fontsize="28" x="1872" y="1344" name="LED_1" orien="R90" />
        <branch name="XLXN_59">
            <wire x2="2192" y1="592" y2="592" x1="1792" />
        </branch>
        <branch name="LED_1">
            <wire x2="1872" y1="976" y2="976" x1="1792" />
            <wire x2="1872" y1="976" y2="1344" x1="1872" />
        </branch>
    </sheet>
</drawing>