module width;

   reg [31:0] c0 = 32'hdeadbeef;
   reg [31:0] c1 = 32'hfeedcafe;
   reg [31:0] zero = 0;
   reg [31:0] idata = c0;
   reg        onebit = 1;
   reg [1:0]  twobit = 3'b11;
   reg [1:0]  twobits [0:1];

   initial begin
     twobits[0] = twobit;
     twobits[1] = zero;
     $display("%x %x", twobits[0], twobits[1]);

     $display("%x %x %x", idata, onebit, twobit);
     idata = onebit;
     $display("%x %x %x", idata, onebit, twobit);
     onebit = c1;
     $display("%x %x %x", idata, onebit, twobit);
     onebit = zero;
     $display("%x %x %x", idata, onebit, twobit);
     $finish;
   end   

endmodule : width
