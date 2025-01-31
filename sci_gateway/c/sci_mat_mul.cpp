/********************************************************************************************
Copyright � 2020 

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
extern "C"
{
#include<Scierror.h>
#include<api_scilab.h>
#include <stdio.h>
#include "localization.h"
#include "openmp.h"
static const char fname[] = "mat_mul";

int sci_mat_mul(scilabEnv env, int nin, scilabVar* in, int nopt, scilabOpt* opt, int nout, scilabVar* out)
{
	double *in1 = NULL;
	double *ptr_row1 = NULL;
	double *ptr_col1 = NULL;

	double *in2 = NULL;
	double *ptr_row2 = NULL;
	double *ptr_col2 = NULL;

	double *out1 = NULL;


if (nin != 6)
    {
        Scierror(77, _("%s: Wrong number of input argument(s): %d expected.\n"), fname, 6);
        return 1;
    }

if (nout != 1)
    {
        Scierror(77, _("%s: Wrong number of output argument(s): %d expected.\n"), fname, 1);
        return 1;
    }
	//Matrix 1
    scilab_getDoubleArray(env, in[0], &in1);
	scilab_getDoubleArray(env, in[1], &ptr_row1);
	scilab_getDoubleArray(env, in[2], &ptr_col1);


	//Matrix 2
	scilab_getDoubleArray(env, in[3], &in2);
	scilab_getDoubleArray(env, in[4], &ptr_row2);
	scilab_getDoubleArray(env, in[5], &ptr_col2);

	int row1 = (int)ptr_row1[0];
	int col1 = (int)ptr_col1[0];

	int row2 = (int)ptr_row2[0];
	int col2 = (int)ptr_col2[0];

	if (col1 != row2)
    {
        Scierror(77, _("%s: No. of column(s) of Matrix 1 should match with no. of row(s) of Matrix 2.\n"), fname);
        return 1;
    }


	out[0] = scilab_createDoubleMatrix2d(env, row1, col2, 0);
   	scilab_getDoubleArray(env, out[0], &out1);

	mat_mul( in1, row1, col1, in2, row2, col2, out1);

    return 0;
}
}
