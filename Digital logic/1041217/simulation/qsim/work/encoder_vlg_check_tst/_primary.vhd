library verilog;
use verilog.vl_types.all;
entity encoder_vlg_check_tst is
    port(
        A0              : in     vl_logic;
        A1              : in     vl_logic;
        A2              : in     vl_logic;
        EON             : in     vl_logic;
        GSN             : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end encoder_vlg_check_tst;
