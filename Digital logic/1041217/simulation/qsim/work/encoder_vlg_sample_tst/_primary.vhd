library verilog;
use verilog.vl_types.all;
entity encoder_vlg_sample_tst is
    port(
        en              : in     vl_logic;
        k0              : in     vl_logic;
        k1              : in     vl_logic;
        k2              : in     vl_logic;
        k3              : in     vl_logic;
        k4              : in     vl_logic;
        k5              : in     vl_logic;
        k6              : in     vl_logic;
        k7              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end encoder_vlg_sample_tst;
