library verilog;
use verilog.vl_types.all;
entity P1041217_vlg_sample_tst is
    port(
        BUTT            : in     vl_logic;
        CLK             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end P1041217_vlg_sample_tst;
