/***************************************************************************
 *   Copyright (C) 2010 by Oliver Bock                                     *
 *   oliver.bock[AT]aei.mpg.de                                             *
 *                                                                         *
 *   This file is part of Einstein@Home (Radio Pulsar Edition).            *
 *                                                                         *
 *   Description:                                                          *
 *   Demodulates dedispersed time series using a bank of orbital           *
 *   parameters. After this step, an FFT of the resampled time series is   *
 *   searched for pulsed, periodic signals by harmonic summing.            *
 *                                                                         *
 *   Einstein@Home is free software: you can redistribute it and/or modify *
 *   it under the terms of the GNU General Public License as published     *
 *   by the Free Software Foundation, version 2 of the License.            *
 *                                                                         *
 *   Einstein@Home is distributed in the hope that it will be useful,      *
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the          *
 *   GNU General Public License for more details.                          *
 *                                                                         *
 *   You should have received a copy of the GNU General Public License     *
 *   along with Einstein@Home. If not, see <http://www.gnu.org/licenses/>. *
 *                                                                         *
 ***************************************************************************/

#include "demod_binary_resamp_cpu.h"

#include <stdlib.h>
#include <math.h>
#include <fftw3.h>
#include "demod_binary.h"
#include "erp_utilities.h"


// TODO: do we wanna keep those global (or use proper C++, or pass them around)?
float *del_t = NULL;

extern float sinSamples[];
extern float cosSamples[];


int set_up_resampling(DIfloatPtr input_dip, DIfloatPtr *output_dip, const RESAMP_PARAMS *const params, float *sinLUTsamples, float *cosLUTsamples)
{
    float * input = input_dip.host_ptr;
    float ** output = & (output_dip->host_ptr);

    // unused
    input = NULL;
    sinLUTsamples = NULL;
    cosLUTsamples = NULL;

    // allocate memory for time offsets in modulated time
#ifndef BRP_FFT_INPLACE
    del_t = (float *) calloc(params->nsamples_unpadded, sizeof(float));
    if(del_t == NULL)
    {
        logMessage(error, true, "Couldn't allocate %d bytes of memory for modulated time steps.\n", params->nsamples_unpadded * sizeof(float));
        return(RADPUL_EMEM);
    }
#endif

    // allocate memory for resampled time series
#ifdef BRP_FFT_INPLACE
    *output = (float *) fftwf_alloc_real(params->fft_size*2);
#else
    *output = (float *) fftwf_alloc_real(params->nsamples);
#endif
    if(*output == NULL)
    {
        logMessage(error, true, "Couldn't allocate %d bytes of memory for resampled time series.\n", params->nsamples * sizeof(float));
        return(RADPUL_EMEM);
    }

#ifdef BRP_FFT_INPLACE
	del_t= *output;
#endif

    return 0;
}

void sincosLUTInitialize(float **sinLUT, float **cosLUT)
{
    *sinLUT = sinSamples;
    *cosLUT = cosSamples;
}


int tear_down_resampling(DIfloatPtr output)
{
#ifndef BRP_FFT_INPLACE
    free(del_t);
#endif
    fftwf_free(output.host_ptr);

    return 0;
}
