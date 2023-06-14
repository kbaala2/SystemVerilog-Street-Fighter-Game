module characterpicker(input logic [7:0] choice,
                       output logic one, two, three, four);

always_comb 
begin
one = 0;
two = 0;
three = 0;
four = 0;
    case(choice)
        8'h1E: one = 1;
        8'h1F: two = 1;
        8'h20: three = 1;
        8'h21: four = 1;
        default: ;
    endcase
end

endmodule