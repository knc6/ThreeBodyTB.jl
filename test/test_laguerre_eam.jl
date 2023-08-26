using Test
using ThreeBodyTB
using Suppressor
#=
include("../Utility.jl")
include("../BandTools.jl")
include("../Atomic.jl")
include("../Atomdata.jl")
include("../Crystal.jl")
include("../DFToutMod.jl")
include("../TB.jl")
include("../CalcTB.jl")
include("../FitTB.jl")
=#

#basic loading

#include("../includes_laguerre.jl")

function test1()
    tbc_list = []
    @testset "testing laguerre fitting fake example" begin

      @suppress  begin

        c0 = makecrys([30.0 0 0; 0 30.0 0; 0 0 30.0], [0 0 0; 0 0 0.15], ["Li", "Li"], units="Bohr");

          
        c1 = makecrys([7.0 0 0; 0 7.0 0; 0 0 7.0], [0 0 0], ["Li"], units="Bohr");
        c2 = makecrys([8.0 0 0; 0 7.0 0; 0 0 7.0], [0 0 0], ["Li"], units="Bohr");
        c3 = makecrys([8.5 0 0; 0 8.5 0; 0 0 7.0], [0 0 0], ["Li"], units="Bohr");
        c4 = makecrys([6.0 0 0; 0 6.0 0; 0 0 6.0], [0 0 0], ["Li"], units="Bohr");

        c5 = makecrys([14.0 0 0; 0 7.0 0; 0 0 7.0], [0 0 0; 0.49 0 0 ], ["Li", "Li"], units="Bohr");
        c6 = makecrys([14.0 0 0; 0 7.0 0; 0 0 7.0], [0 0 0; 0.45 0 0 ], ["Li", "Li"], units="Bohr");
        c7 = makecrys([14.0 0 0; 0 7.0 0; 0 0 7.0], [0 0 0; 0.40 0 0 ], ["Li", "Li"], units="Bohr");
        c8 = makecrys([14.0 0 0; 0 7.0 0; 0 0 7.0], [0 0 0; 0.35 0 0 ], ["Li", "Li"], units="Bohr");
        c9 = makecrys([14.0 0 0; 0 7.0 0; 0 0 7.0], [0 0 0; 0.47 0 0 ], ["Li", "Li"], units="Bohr");
        c10 = makecrys([14.0 0 0; 0 7.0 0; 0 0 7.0], [0 0 0; 0.30 0 0 ], ["Li", "Li"], units="Bohr");

          c4a = makecrys([5.0 0 0; 0 5.0 0; 0 0 5.0], [0 0 0], ["Li"], units="Bohr");
          c4b = makecrys([4.0 0 0; 0 4.0 0; 0 0 4.0], [0 0 0], ["Li"], units="Bohr");
          c4c = makecrys([3.0 0 0; 0 3.0 0; 0 0 3.0], [0 0 0], ["Li"], units="Bohr");
          c4d = makecrys([3.5 0 0; 0 3.5 0; 0 0 3.5], [0 0 0], ["Li"], units="Bohr");

            
        begin
            #        if true

            database = Dict()

            co = ThreeBodyTB.CalcTB.make_coefs(Set(["Li", "Li"]), 2, use_eam=true, fillzeros=false)
            #            co.datH[co.inds[[:Li, :eam]]] .= 1.0
            database[(:Li, :Li)] = co
            
            lj_repel=0.05
            
            tbc0 = ThreeBodyTB.CalcTB.calc_tb_LV(c0, database, use_threebody=false, use_threebody_onsite=false, lj_repel=lj_repel);

            tbc1 = ThreeBodyTB.CalcTB.calc_tb_LV(c1, database, use_threebody=false, use_threebody_onsite=false, lj_repel=lj_repel);
            tbc2 = ThreeBodyTB.CalcTB.calc_tb_LV(c2, database, use_threebody=false, use_threebody_onsite=false, lj_repel=lj_repel);
            tbc3 = ThreeBodyTB.CalcTB.calc_tb_LV(c3, database, use_threebody=false, use_threebody_onsite=false, lj_repel=lj_repel);
            tbc4 = ThreeBodyTB.CalcTB.calc_tb_LV(c4, database, use_threebody=false, use_threebody_onsite=false, lj_repel=lj_repel);
            tbc4a = ThreeBodyTB.CalcTB.calc_tb_LV(c4a, database, use_threebody=false, use_threebody_onsite=false, lj_repel=lj_repel);
            tbc4b = ThreeBodyTB.CalcTB.calc_tb_LV(c4b, database, use_threebody=false, use_threebody_onsite=false, lj_repel=lj_repel);
            tbc4c = ThreeBodyTB.CalcTB.calc_tb_LV(c4c, database, use_threebody=false, use_threebody_onsite=false, lj_repel=lj_repel);
            tbc4d = ThreeBodyTB.CalcTB.calc_tb_LV(c4d, database, use_threebody=false, use_threebody_onsite=false, lj_repel=lj_repel);
            tbc5 = ThreeBodyTB.CalcTB.calc_tb_LV(c5, database, use_threebody=false, use_threebody_onsite=false, lj_repel=lj_repel);
            tbc6 = ThreeBodyTB.CalcTB.calc_tb_LV(c6, database, use_threebody=false, use_threebody_onsite=false, lj_repel=lj_repel);
            tbc7 = ThreeBodyTB.CalcTB.calc_tb_LV(c7, database, use_threebody=false, use_threebody_onsite=false, lj_repel=lj_repel);
            tbc8 = ThreeBodyTB.CalcTB.calc_tb_LV(c8, database, use_threebody=false, use_threebody_onsite=false, lj_repel=lj_repel);
            tbc9 = ThreeBodyTB.CalcTB.calc_tb_LV(c9, database, use_threebody=false, use_threebody_onsite=false, lj_repel=lj_repel);
            tbc10 = ThreeBodyTB.CalcTB.calc_tb_LV(c10, database, use_threebody=false, use_threebody_onsite=false, lj_repel=lj_repel);
            
            tbc_list = [tbc0, tbc1, tbc2, tbc3, tbc4, tbc5, tbc6, tbc7, tbc8, tbc9, tbc10,tbc4a, tbc4b, tbc4c, tbc4d]

            newdatabase = ThreeBodyTB.FitTB.do_fitting(tbc_list, fit_threebody=false, fit_threebody_onsite=false, do_plot=false, use_eam=true, lj_repel=lj_repel)
#            newdatabase = ThreeBodyTB.FitTB.do_fitting_recursive(tbc_list, fit_threebody=false, fit_threebody_onsite=false, do_plot=false, use_eam=true)


            #        println("newdartabase")
            #        println(newdatabase[("Li", "Li")])
            println(newdatabase[(:Li, :Li)].datH)
            println(database[(:Li, :Li)].datH)
            println(sum(abs.(newdatabase[(:Li, :Li)].datH .- database[(:Li, :Li)].datH)))
            @test sum(abs.(newdatabase[(:Li, :Li)].datH .- database[(:Li, :Li)].datH)) ≤ 1.5e-3

        end
        
        end
    end
    return tbc_list
end


tbc_list = test1();
Nothing
