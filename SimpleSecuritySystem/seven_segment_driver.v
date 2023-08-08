module seven_segment_driver(
    input [3:0] seg_select,
    input [6:0] seg_data,
    output reg [6:0] seg_out
    );

    always @(*) begin
        case(seg_select)
            4'b0000: seg_out = seg_data;
            4'b0001: seg_out = ~seg_data;
            4'b0010: seg_out = ~seg_data;
            4'b0011: seg_out = ~seg_data;
            4'b0100: seg_out = ~seg_data;
            4'b0101: seg_out = ~seg_data;
            4'b0110: seg_out = ~seg_data;
            4'b0111: seg_out = ~seg_data;
            4'b1000: seg_out = ~seg_data;
            4'b1001: seg_out = ~seg_data;
            4'b1010: seg_out = ~seg_data;
            4'b1011: seg_out = ~seg_data;
            4'b1100: seg_out = ~seg_data;
            4'b1101: seg_out = ~seg_data;
            4'b1110: seg_out = ~seg_data;
            4'b1111: seg_out = ~seg_data;
            default: seg_out = 7'b0000000;
        endcase
    end
endmodule
