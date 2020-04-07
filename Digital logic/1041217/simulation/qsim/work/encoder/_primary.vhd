library verilog;
use verilog.vl_types.all;
entity encoder is
    port(
        EON             : out    vl_logic;
        k5              : in     vl_logic;
        k0              : in     vl_logic;
        k1              : in     vl_logic;
        k2              : in     vl_logic;
        k3              : in     vl_logic;
        k4              : in     vl_logic;
        en              : in     vl_logic;
        k6              : in     vl_logic;
        k7              : in     vl_logic;
        GSN             : out    vl_logic;
        A0              : out    vl_logic;
        A1              : out    vl_logic;
        A2              : out    vl_logic
    );
end encoder;
