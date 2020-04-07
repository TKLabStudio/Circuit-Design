library verilog;
use verilog.vl_types.all;
entity decoder is
    port(
        Y7N             : out    vl_logic;
        \40Mhz\         : in     vl_logic;
        G1              : in     vl_logic;
        G2N             : in     vl_logic;
        Y6N             : out    vl_logic;
        Y5N             : out    vl_logic;
        Y4N             : out    vl_logic;
        Y3N             : out    vl_logic;
        Y2N             : out    vl_logic;
        Y1N             : out    vl_logic;
        Y0N             : out    vl_logic
    );
end decoder;
