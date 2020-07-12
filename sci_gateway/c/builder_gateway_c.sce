/********************************************************************************************
Copyright © 2020 

Authors: Surya Prasad S, Yeshwanth R, Tharun Bhargav A, Aravind Krishna R, Dr. Maheswari R
Organization: VIT Chennai
Email: suryavirat09@gmail.com, yeshwa.rp@gmail.com, tharun.cam@gmail.com, aravind2000krishna@gmail, maheswari.r@vit.ac.in 

This toolbox integrates the functionalities of OpenMP with Scilab. 

This file must be used under the terms of CeCILL. This source file is licensed as described in the 
file LICENSE, which you should have received as part of this distribution. The terms are also 
available at
https://cecill.info/licences/Licence_CeCILL_V2-en.txt 

This software is governed by the CeCILL  license under French law and
abiding by the rules of distribution of free software.  You can  use, 
modify and/ or redistribute the software under the terms of the CeCILL
license as circulated by CEA, CNRS and INRIA at the following URL
"http://www.cecill.info". 

As a counterpart to the access to the source code and  rights to copy,
modify and redistribute granted by the license, users are provided only
with a limited warranty  and the software's author,  the holder of the
economic rights,  and the successive licensors  have only  limited
liability. 

In this respect, the user's attention is drawn to the risks associated
with loading,  using,  modifying and/or developing or reproducing the
software by the user in light of its specific status of free software,
that may mean  that it is complicated to manipulate,  and  that  also
therefore means  that it is reserved for developers  and  experienced
professionals having in-depth computer knowledge. Users are therefore
encouraged to load and test the software's suitability as regards their
requirements in conditions enabling the security of their systems and/or 
data to be ensured and,  more generally, to use and operate it in the 
same conditions as regards security. 

The fact that you are presently reading this means that you have had
knowledge of the CeCILL license and that you accept its terms.
********************************************************************************************/

function builder_gw_c()

    includes_src_c = ilib_include_flag(get_absolute_file_path("builder_gateway_c.sce") + "../../src/c");
    WITHOUT_AUTO_PUTLHSVAR = %t;

    tbx_build_gateway("scimp_c", ..
    ["get_total_thread","sci_gettnum","csci6";...
    "set_total_thread","sci_settnum","csci6"; ...
	"get_thread_num","sci_get_thread_num","csci6"; ...
    "get_max_threads","sci_get_max_threads","csci6";...
    "get_num_procs","sci_getnumprocs","csci6";...
    "omp","sci_omp","csci6";...
    "get_wtime","sci_wtime","csci6";...
    "get_dynamic","sci_get_dynamic","csci6";...
    "get_max_active_levels","sci_get_max_active_levels","csci6";
    "set_max_active_levels","sci_set_max_active_levels","csci6";...
    "set_dynamic","sci_set_dynamic","csci6";...
    "get_nested","sci_get_nested","csci6";...
    "set_nested","sci_set_nested","csci6";...
    "get_team_num","sci_get_team_num","csci6";...
    "get_num_teams","sci_get_num_teams","csci6";...
    "mat_mul","sci_mat_mul","csci6";...
    "master","sci_master","csci6";...
    "critical","sci_critical","csci6";...
    "single","sci_single","csci6";...
    "get_level","sci_get_level","csci6";
    "get_active_level","sci_get_active_level","csci6";...
    "get_thread_limit","sci_get_thread_limit","csci6";...
    "in_parallel","sci_in_parallel","csci6";...
    "init_lock","sci_init_lock","csci6";...
    "set_lock","sci_set_lock","csci6";...
    "unset_lock","sci_unset_lock","csci6";...
    "destroy_lock","sci_destroy_lock","csci6";...
    "team","sci_team","csci6";], ...
    ["sci_gettnum.cpp","sci_settnum.cpp","sci_get_thread_num.cpp","sci_get_max_threads.cpp","sci_getnumprocs.cpp","sci_omp.cpp"...
    "sci_wtime.cpp","sci_get_dynamic.cpp","sci_get_max_active_levels.cpp","sci_set_max_active_levels.cpp",...
    "sci_set_dynamic.cpp","sci_get_nested.cpp","sci_set_nested.cpp","sci_get_team_num.cpp",...
    "sci_get_num_teams.cpp","sci_mat_mul.cpp","sci_master.cpp","sci_critical.cpp","sci_single.cpp","sci_get_level.cpp",...
    "sci_get_active_level.cpp","sci_get_thread_limit.cpp","sci_in_parallel.cpp","sci_init_lock.cpp","sci_set_lock.cpp"...
    "sci_unset_lock.cpp","sci_destroy_lock.cpp","sci_team.cpp"], ...
    get_absolute_file_path("builder_gateway_c.sce"), ...
    ["../../src/c/libgettnum"], ...
    "", ...
    includes_src_c);

endfunction

builder_gw_c();
clear builder_gw_c; // remove builder_gw_c on stack
