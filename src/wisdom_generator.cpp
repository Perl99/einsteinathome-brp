/***************************************************************************
 *   Copyright (C) 2023 by Paweł Perłakowski                               *
 *   Under GNU General Public License version 2                            *
 *   See <http://www.gnu.org/licenses/>.                                   *
 *                                                                         *
 ***************************************************************************/

#include <cstdio>
#include <cstdlib>
#include <string>
#include <fftw3.h>

int main(int argc, char* argv[])
{
    printf("Compiled with flags: %s\n", CXX_FLAGS);
    
    unsigned long long fft_size = 6291457;
    if (argc == 2) {
        printf("Using first argument as FFT size.\n");
        fft_size = atoll(argv[1]);
    } else {
        printf("Using default FFT size: %llu.\n", fft_size);
    }
    
    unsigned long long fft_input_size = (fft_size - 1) * 2;
    
    printf("Allocating memory...\n");
    float *in = (float*) fftwf_alloc_real(fft_input_size);
    fftwf_complex *out = (fftwf_complex*) fftwf_alloc_complex(fft_size);
	
    if (fftwf_import_system_wisdom()) {
        printf("Loaded system-wide wisdom.\n");
    } else if (fftwf_import_wisdom_from_filename("BRP4.wisdom")) {
        printf("Loaded local BRP4.wisdom.\n");
    } else {
        printf("No system-wide wisdom, ignoring.\n");
    }

    printf("Generating plan with mode FFTW_PATIENT...\n");
    fftwf_plan fft_plan = fftwf_plan_dft_r2c_1d(fft_input_size, in, out, FFTW_PATIENT);
    if (!fft_plan) {
        printf("Unable to create plan!\n");
        return -2;
    }
    
    printf("Generated plan:\n");
    fftwf_print_plan(fft_plan);
    printf("\n");

    if (fftwf_export_wisdom_to_filename("BRP4.wisdom")) {
        printf("Exported to file BRP4.wisdom.\n");
        return 0;
    } else {
        printf("Unable to export to file!\n");
        return -1;
    }
}
